# Profile - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The profile feature allows users to manage their personal information, display preferences, and account settings within the NMB Mobile app. This feature provides users with control over their profile picture, preferred display name, and other personal preferences that enhance their banking experience.

### User Personas and Use Cases
**Primary Users:**
- **Personal Banking Customers:** Users who want to personalize their banking experience
- **Privacy-Conscious Users:** Customers who prefer to use display names rather than full legal names
- **Multi-Device Users:** Users who want consistent profile information across devices
- **Accessibility Users:** Customers who need customized display preferences for better usability

**Use Cases:**
- **Profile Personalization:** Set a preferred display name and profile picture
- **Privacy Management:** Use shorter, more private display names in the app interface
- **Photo Management:** Update profile picture for better account identification
- **Display Preferences:** Customize how their name appears throughout the app
- **Account Identification:** Quick visual identification in multi-user scenarios

### Business Requirements
- Allow users to customize their display name while maintaining legal name records
- Support profile picture upload and management with appropriate size and format restrictions
- Maintain data consistency across all app interfaces
- Provide clear distinction between legal name (for official records) and preferred name (for display)
- Ensure profile changes are reflected immediately throughout the app
- Support privacy preferences for name display
- Maintain audit trail for profile changes for security purposes

## 2. User Journey

### Entry Points
- **Dashboard Profile Circle:** Tap on user profile picture/initials in dashboard header
- **Settings Menu:** Access via main app settings
- **Account Management:** Direct navigation from account management screens
- **First-Time Setup:** During initial app onboarding (optional)

### User Flow
```
Dashboard → Profile Circle Tap → Profile Screen → [Edit Options] → Save Changes → Dashboard
    ↑                                    ↓              ↓
    ←──── Back Navigation ←──── Photo Change ←──── Name Edit
```

### Navigation Patterns
- **Header Navigation:** Back arrow to return to dashboard
- **Modal Editing:** Name editing opens in focused input mode
- **Photo Selection:** Camera/gallery picker for profile picture updates
- **Auto-Save:** Changes save automatically or with explicit save action
- **Confirmation:** Success feedback when changes are saved

### Exit Points
- **Back to Dashboard:** Return to main dashboard with updated profile
- **Settings Navigation:** Continue to other settings screens
- **Logout Option:** Access to logout functionality (if included in profile)
- **Account Switching:** Navigate to account management (if multi-account)

## 3. Visual Design

### Layout Structure
**Screen Composition (Vertical):**
- **Header Section (0-15%):** Navigation and page title
- **Profile Information Card (15-35%):** Official account name display
- **Profile Picture Section (35-65%):** Centered profile image with edit option
- **Preferred Name Section (65-85%):** Display name with edit functionality
- **Action Area (85-100%):** Edit button and additional options

### Header Section
**Design Specifications:**
- **Background:** Blue gradient with dotted pattern (consistent with dashboard)
- **Height:** 120dp
- **Back Arrow:**
  - Icon: Left arrow (24dp)
  - Color: White
  - Position: Left, 16dp margin
  - Touch Target: 44x44dp

**Page Title:**
- **Text:** "Preferred Name & Photo"
- **Typography:** 20sp, medium weight, white
- **Position:** Center-aligned horizontally
- **Vertical Position:** Center of header section

### Profile Information Card
**Card Specifications:**
- **Background:** White with subtle shadow
- **Corner Radius:** 12dp
- **Margins:** 20dp horizontal
- **Elevation:** 2dp shadow
- **Padding:** 16dp all around

**Content Layout:**
- **Icon:** Profile/ID card icon (24dp, orange #FF6B35)
- **Primary Label:** "Profile name" (14sp, regular weight, dark gray)
- **Secondary Label:** "NMB Mkononi" (12sp, regular weight, medium gray)
- **Full Name Display:** "DAVID KUNONGA MEZZA" (16sp, bold, dark gray)
- **Layout:** Icon and labels on left, full name right-aligned

### Profile Picture Section
**Image Container:**
- **Size:** 120dp diameter circular container
- **Position:** Center-aligned horizontally
- **Margin:** 32dp from profile card, 24dp to preferred name section

**Profile Picture:**
- **Size:** 120dp diameter, circular crop
- **Border:** 3dp white border with subtle shadow
- **Default State:** User photo or generated avatar
- **Empty State:** User initials on colored background

**Edit Indicator:**
- **Icon:** Small camera/edit icon (16dp)
- **Position:** Bottom right of profile picture
- **Background:** White circle with shadow
- **Color:** Orange (#FF6B35)

**Action Text:**
- **Text:** "Click to change your display picture"
- **Typography:** 14sp, regular weight, medium gray
- **Position:** Center-aligned below profile picture
- **Margin:** 16dp from profile picture

### Preferred Name Section
**Display Layout:**
- **Name Display:** "DAVID MEZZA" (20sp, bold, orange #FF6B35)
- **Label:** "Preferred Name" (14sp, regular weight, medium gray)
- **Position:** Center-aligned
- **Spacing:** 8dp between name and label

### Action Button
**Button Specifications:**
- **Width:** Full width minus 40dp margins (20dp each side)
- **Height:** 56dp
- **Background:** Transparent with blue border (2dp, #1E4A8C)
- **Corner Radius:** 28dp (rounded pill shape)
- **Text:** "Edit Preferred Name" (16sp, medium weight, blue #1E4A8C)
- **Position:** 32dp below preferred name section

**Button States:**
- **Normal:** Blue border and text
- **Pressed:** Light blue background (#E3F2FD) with darker blue border
- **Disabled:** Gray border and text (if editing restrictions apply)

### Responsive Design Considerations
**Small Screens (<360dp width):**
- Reduce profile picture size to 100dp
- Adjust margins and spacing proportionally
- Maintain minimum touch targets for all interactive elements

**Large Screens (>400dp width):**
- Maintain profile picture at 120dp
- Increase margins for better visual balance
- Consider larger typography for better readability

**Landscape Orientation:**
- Compress vertical spacing
- Consider horizontal layout for profile picture and info
- Maintain functionality while optimizing space usage

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final profileStateProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(ref.read(profileRepositoryProvider)),
);

final profilePictureProvider = StateProvider<File?>((ref) => null);

final preferredNameProvider = StateProvider<String?>((ref) => null);

final profileEditModeProvider = StateProvider<bool>((ref) => false);
```

### State Classes
```dart
// Profile States
abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final UserProfileData profile;
  ProfileLoaded(this.profile);
}
class ProfileUpdating extends ProfileState {}
class ProfileUpdateSuccess extends ProfileState {
  final UserProfileData updatedProfile;
  ProfileUpdateSuccess(this.updatedProfile);
}
class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

// Profile Notifier
class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _profileRepository;
  
  ProfileNotifier(this._profileRepository) : super(ProfileInitial()) {
    loadProfile();
  }
  
  Future<void> loadProfile() async {
    state = ProfileLoading();
    try {
      final profile = await _profileRepository.getUserProfile();
      state = ProfileLoaded(profile);
    } catch (e) {
      state = ProfileError(e.toString());
    }
  }
  
  Future<void> updatePreferredName(String newName) async {
    if (state is ProfileLoaded) {
      state = ProfileUpdating();
      try {
        final currentProfile = (state as ProfileLoaded).profile;
        final updatedProfile = await _profileRepository.updatePreferredName(newName);
        state = ProfileUpdateSuccess(updatedProfile);
        // Auto-transition back to loaded state
        Future.delayed(Duration(seconds: 1), () {
          state = ProfileLoaded(updatedProfile);
        });
      } catch (e) {
        state = ProfileError(e.toString());
      }
    }
  }
  
  Future<void> updateProfilePicture(File imageFile) async {
    if (state is ProfileLoaded) {
      state = ProfileUpdating();
      try {
        final updatedProfile = await _profileRepository.updateProfilePicture(imageFile);
        state = ProfileUpdateSuccess(updatedProfile);
        Future.delayed(Duration(seconds: 1), () {
          state = ProfileLoaded(updatedProfile);
        });
      } catch (e) {
        state = ProfileError(e.toString());
      }
    }
  }
}
```

### Data Models
```dart
class UserProfileData {
  final String userId;
  final String fullName;
  final String preferredName;
  final String? profilePictureUrl;
  final String? profilePictureLocalPath;
  final String initials;
  final String accountType;
  final DateTime lastUpdated;
  final ProfileSettings settings;
  
  const UserProfileData({
    required this.userId,
    required this.fullName,
    required this.preferredName,
    this.profilePictureUrl,
    this.profilePictureLocalPath,
    required this.initials,
    required this.accountType,
    required this.lastUpdated,
    required this.settings,
  });
  
  UserProfileData copyWith({
    String? preferredName,
    String? profilePictureUrl,
    String? profilePictureLocalPath,
    DateTime? lastUpdated,
  }) {
    return UserProfileData(
      userId: userId,
      fullName: fullName,
      preferredName: preferredName ?? this.preferredName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      profilePictureLocalPath: profilePictureLocalPath ?? this.profilePictureLocalPath,
      initials: initials,
      accountType: accountType,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      settings: settings,
    );
  }
}

class ProfileSettings {
  final bool showFullNameInDashboard;
  final bool allowProfilePictureInTransactions;
  final String preferredLanguage;
  final bool enableProfilePictureSync;
  
  const ProfileSettings({
    required this.showFullNameInDashboard,
    required this.allowProfilePictureInTransactions,
    required this.preferredLanguage,
    required this.enableProfilePictureSync,
  });
}

class ProfileUpdateRequest {
  final String? preferredName;
  final File? profilePicture;
  final Map<String, dynamic>? settings;
  
  const ProfileUpdateRequest({
    this.preferredName,
    this.profilePicture,
    this.settings,
  });
}
```

### API Requirements
**Profile Management:**
- GET `/api/v1/profile` - Get user profile information
- PUT `/api/v1/profile/preferred-name` - Update preferred display name
- POST `/api/v1/profile/picture` - Upload new profile picture
- DELETE `/api/v1/profile/picture` - Remove profile picture
- PUT `/api/v1/profile/settings` - Update profile preferences

**Image Handling:**
- POST `/api/v1/upload/profile-picture` - Upload profile image with validation
- GET `/api/v1/profile/picture/{userId}` - Get profile picture URL
- Support for multiple image formats (JPEG, PNG, WebP)
- Image size validation and automatic resizing

**Profile History:**
- GET `/api/v1/profile/history` - Get profile change history (for audit)
- POST `/api/v1/profile/audit` - Log profile access and changes

### Error Handling
**Image Upload Errors:**
- **File Size Too Large:** Clear message with size limits and compression options
- **Invalid Format:** Supported format list and conversion suggestions
- **Upload Failed:** Retry mechanism with network status feedback
- **Processing Failed:** Server-side image processing error handling

**Name Validation Errors:**
- **Invalid Characters:** Clear feedback on allowed characters
- **Length Restrictions:** Min/max character limits with counter
- **Profanity Filter:** Appropriate rejection with alternative suggestions
- **Duplicate Names:** Handle if business rules prevent duplicates

**Network Errors:**
- **Connection Issues:** Cache changes locally and sync when connected
- **Server Errors:** Graceful degradation with retry options
- **Session Expired:** Automatic re-authentication flow
- **Permission Denied:** Clear explanation and alternative actions

## 5. Interactions & Animations

### Micro-interactions
**Profile Picture Interactions:**
- **Tap Animation:** Scale to 1.05x for 100ms with subtle shadow increase
- **Upload Progress:** Circular progress indicator around profile picture
- **Success Feedback:** Brief checkmark animation overlay on successful upload
- **Camera Icon:** Subtle bounce animation to indicate interactivity

**Name Edit Interactions:**
- **Edit Button:** Scale animation and color transition on press
- **Text Input:** Smooth transition to edit mode with cursor animation
- **Save Animation:** Brief success animation with color feedback
- **Cancel Animation:** Smooth transition back to display mode

**Button Interactions:**
- **Edit Button:** Ripple effect starting from center of button
- **Hover State:** Subtle background color change for better feedback
- **Loading State:** Button text replaced with loading spinner

### Transitions
**Screen Entry:**
- **Slide Animation:** Profile screen slides in from right (300ms)
- **Staggered Loading:** Profile card, then picture, then name section
- **Fade In:** Content fades in with slight upward movement

**Edit Mode Transitions:**
- **Name Edit:** Smooth transition from display text to input field
- **Modal Overlay:** Semi-transparent overlay for focused editing
- **Keyboard Animation:** Content adjusts smoothly for keyboard appearance

**Image Selection:**
- **Camera/Gallery:** Bottom sheet slide-up animation for source selection
- **Crop Interface:** Smooth transition to image cropping interface
- **Preview:** Fade transition showing new image before confirmation

### Loading States
**Profile Loading:**
- **Skeleton Screen:** Show layout structure with loading placeholders
- **Progressive Loading:** Load basic info first, then profile picture
- **Shimmer Effect:** Animated placeholders for loading content

**Image Upload:**
- **Progress Indicator:** Circular progress around profile picture
- **Upload States:** Visual feedback for upload, processing, and completion
- **Retry Interface:** Clear retry option if upload fails

**Save Operations:**
- **Button Loading:** Loading spinner replaces button text during save
- **Optimistic Updates:** Show changes immediately with rollback on error
- **Success Feedback:** Brief animation confirming successful save

### Feedback Mechanisms
**Haptic Feedback:**
- **Image Selection:** Light impact when selecting new profile picture
- **Save Success:** Success haptic pattern when changes are saved
- **Error States:** Error haptic pattern for validation failures

**Visual Feedback:**
- **Form Validation:** Real-time validation with color-coded feedback
- **Character Limit:** Live character counter for name field
- **Upload Progress:** Visual progress indicator with percentage
- **Success States:** Green checkmark animations for successful operations

**Audio Feedback (Optional):**
- **Camera Shutter:** Sound effect when taking profile picture (user preference)
- **Success Sound:** Subtle success chime for completed actions
- **Error Sound:** Gentle error tone for validation failures

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Profile Picture:** Descriptive labels for profile image and edit options
- **Name Fields:** Clear labeling of full name vs. preferred name
- **Edit Actions:** Announce when entering and exiting edit modes
- **Status Updates:** Announce save success and error states

**Motor Accessibility:**
- **Touch Targets:** All interactive elements minimum 44dp
- **Profile Picture:** Large target area for easier selection
- **Alternative Input:** Support for voice input for name changes
- **Gesture Support:** Simple tap gestures without complex interactions

**Visual Accessibility:**
- **High Contrast:** Support system high contrast for all text and buttons
- **Text Scaling:** Support up to 200% text scaling with layout adjustments
- **Color Independence:** Don't rely solely on color for status indication
- **Focus Indicators:** Clear focus indicators for keyboard/switch navigation

**Cognitive Accessibility:**
- **Clear Instructions:** Simple, direct language for all actions
- **Undo Options:** Allow users to revert changes easily
- **Confirmation:** Clear confirmation for significant changes
- **Error Recovery:** Helpful guidance for resolving validation errors

### Performance Considerations
**Image Optimization:**
- **Local Caching:** Cache profile pictures locally for quick access
- **Compression:** Automatic image compression without quality loss
- **Format Selection:** Choose optimal format based on device capabilities
- **Progressive Loading:** Load low-quality placeholder then full resolution

**Memory Management:**
- **Image Memory:** Efficient handling of profile image memory usage
- **State Cleanup:** Proper cleanup when leaving profile screen
- **Cache Management:** Automatic cleanup of old profile image caches

**Network Efficiency:**
- **Delta Updates:** Only send changed data to server
- **Offline Support:** Allow profile viewing and editing offline with sync
- **Retry Logic:** Smart retry for failed uploads with exponential backoff
- **Data Compression:** Compress API requests and responses

### Testing Requirements
**Unit Tests:**
- **State Management:** Test all profile state transitions and updates
- **Data Validation:** Test name validation and image format checking
- **Repository Logic:** Test profile data fetching and updating
- **Error Handling:** Test all error scenarios and recovery paths

**Widget Tests:**
- **Profile Display:** Test profile information rendering
- **Edit Interactions:** Test name editing and profile picture selection
- **Form Validation:** Test input validation and error display
- **Responsive Layout:** Test layout at different screen sizes

**Integration Tests:**
- **Full Profile Flow:** End-to-end profile viewing and editing
- **Image Upload:** Test complete image selection and upload process
- **API Integration:** Test profile API calls and error handling
- **Cross-Screen Updates:** Verify profile changes reflect in dashboard

**Accessibility Tests:**
- **Screen Reader:** Test with VoiceOver/TalkBack
- **Keyboard Navigation:** Test navigation without touch
- **High Contrast:** Test visibility in high contrast mode
- **Text Scaling:** Test layout with maximum text scaling

## 7. Future Enhancements

### Planned Improvements
**Advanced Profile Features:**
- **Multiple Profile Pictures:** Support for different pictures for different contexts
- **Custom Avatars:** Generated avatars or emoji-based profile representations
- **Profile Themes:** Custom color themes for personal branding
- **Bio/Status:** Short personal bio or status message functionality

**Enhanced Personalization:**
- **Nickname Management:** Multiple nicknames for different app contexts
- **Profile Privacy:** Granular control over what information is visible where
- **Social Features:** Profile sharing with family/friends for group accounts
- **Professional Profiles:** Business vs. personal profile modes

**Security Enhancements:**
- **Profile Change Verification:** Additional authentication for sensitive changes
- **Change History:** Detailed audit log of all profile modifications
- **Suspicious Activity:** Alerts for unexpected profile changes
- **Backup & Recovery:** Profile backup and recovery options

**Integration Features:**
- **Social Media Sync:** Import profile pictures from social media accounts
- **Contact Integration:** Auto-complete from device contacts
- **Cloud Sync:** Sync profile across multiple devices
- **Family Accounts:** Linked family member profiles and management

### Technical Debt Considerations
**Image Management:**
- **Advanced Compression:** Implement more sophisticated image optimization
- **CDN Integration:** Use content delivery network for profile images
- **Background Sync:** Intelligent background syncing of profile changes
- **Format Support:** Support for newer image formats and animated avatars

**State Management:**
- **Caching Strategy:** More sophisticated caching for profile data
- **Offline-First:** Robust offline capabilities with conflict resolution
- **Real-time Updates:** Live updates when profile changes from other devices
- **Performance Monitoring:** Detailed performance tracking for profile operations

**Security Architecture:**
- **Data Encryption:** Enhanced encryption for profile data at rest and in transit
- **Access Controls:** More granular permissions for profile information
- **Audit Compliance:** Enhanced audit logging for regulatory compliance
- **Privacy Controls:** Advanced privacy settings and data control options

**Maintainability:**
- **Component Reusability:** Extract reusable profile components for other features
- **API Versioning:** Proper API versioning for profile endpoints
- **Documentation:** Comprehensive documentation for profile customization
- **Testing Framework:** Enhanced automated testing for profile functionality