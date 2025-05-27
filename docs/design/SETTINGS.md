# Settings - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The settings feature provides users with comprehensive control over their NMB Mobile app experience, including personalization options, security settings, language preferences, and account management. This feature serves as the central hub for all app configurations and user preferences.

### User Personas and Use Cases
**Primary Users:**
- **Security-Conscious Users:** Customers who want to manage PIN, biometric authentication, and device security
- **Personalization-Focused Users:** Users who prefer customizing their app experience (themes, notifications, display preferences)
- **Multi-Language Users:** Customers who need to switch between English and Swahili
- **Privacy-Aware Users:** Customers who want to review terms of use and manage linked devices
- **Technical Users:** Users who need to manage email settings and device connections

**Use Cases:**
- **Security Management:** Change PIN, enable/disable biometric authentication, manage linked devices
- **Personalization:** Toggle notifications, change themes, update email and profile information
- **Language Switching:** Change app language between English and Swahili
- **Privacy Control:** Review terms of use, manage device connections, logout functionality
- **Account Maintenance:** Update email addresses, manage notification preferences
- **Troubleshooting:** Access app version information, device management

### Business Requirements
- Provide comprehensive security controls for user account protection
- Enable personalization options to improve user experience
- Support multiple languages for diverse user base
- Maintain transparency with clear terms of use and privacy information
- Allow users to manage connected devices for security purposes
- Provide easy access to logout functionality
- Ensure settings changes are persistent across app sessions
- Support accessibility requirements for all settings interactions

## 2. User Journey

### Entry Points
- **Dashboard Gear Icon:** Primary access from top-right settings icon in dashboard
- **Profile Settings:** Navigation from profile-related settings
- **Security Alerts:** Direct navigation to security settings from alerts
- **Language Switching:** Quick access for language preference changes

### User Flow
```
Dashboard → Settings Icon → Settings Menu → [Category Selection] → Specific Setting → [Modal/Screen] → Save/Apply → Settings Menu
    ↑                          ↓                    ↓                     ↓
    ←── Back Navigation ←── Category Navigation ←── Setting Modification ←── Confirmation
                                ↓
                          Sub-category Access (PIN Change, Theme Selection, etc.)
```

### Navigation Patterns
- **Hierarchical Navigation:** Main settings → category → specific setting → modification
- **Modal Interactions:** Email input, PIN change, theme selection use modals
- **Toggle Switches:** Immediate feedback for boolean settings (notifications, biometric)
- **List Selection:** Radio button selection for themes and languages
- **External Navigation:** Profile settings link to dedicated profile management
- **Logout Flow:** Confirmation and secure logout process

### Exit Points
- **Back to Dashboard:** Return to main app interface
- **Profile Management:** Navigation to profile-specific settings
- **App Logout:** Secure logout with confirmation
- **External Links:** Terms of use and privacy policy viewing

## 3. Visual Design

### Layout Structure
**Screen Composition (Vertical):**
- **Header Section (0-15%):** Navigation and page title
- **Settings Categories (15-90%):** Grouped settings in scrollable list
- **Footer Information (90-100%):** App version and logout option

### Header Section
**Design Specifications:**
- **Background:** Blue gradient with dotted pattern (consistent with app theme)
- **Height:** 120dp
- **Back Arrow:**
  - Icon: Left arrow (24dp)
  - Color: White
  - Position: Left, 16dp margin
  - Touch Target: 44x44dp

**Page Title:**
- **Text:** "Settings"
- **Typography:** 20sp, medium weight, white
- **Position:** Center-aligned horizontally

### Settings Categories Layout
**Category Structure:**
- **Background:** Light gray (#F5F5F5)
- **Category Headers:** Bold section labels with 16dp vertical margin
- **Setting Items:** White cards with 8dp vertical spacing between items
- **Card Specifications:** 12dp corner radius, 2dp elevation, 16dp padding

### Personalization Section

#### Section Header
- **Text:** "Personalization"
- **Typography:** 18sp, bold, dark gray (#424242)
- **Margin:** 24dp top, 16dp bottom

#### Account Balance Notification
- **Layout:** Horizontal layout with label and toggle switch
- **Label:** "Account Balance Notification" (16sp, regular, dark gray)
- **Toggle Switch:**
  - Size: 32x20dp
  - Track Color: Light gray (inactive), blue (active)
  - Thumb Color: White
  - Position: Right-aligned

#### My Email
- **Layout:** Horizontal layout with label and chevron
- **Label:** "My Email" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Opens email input modal

**Email Input Modal:**
- **Title:** "Add Your Email" (20sp, bold, center-aligned)
- **Input Field:**
  - Placeholder: "Enter Email Address"
  - Background: Light gray (#F5F5F5)
  - Border: 1dp light gray, blue when focused
  - Height: 56dp
  - Corner Radius: 8dp
- **Button:** "PROCEED" (blue background, white text, full width)

#### Preferred Name & Photo
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Preferred Name & Photo" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Navigation to profile management screen

#### Theme
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Theme" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Opens theme selection modal

**Theme Selection Modal:**
- **Title:** "Change Theme" (20sp, bold)
- **Options:** Vertical list with radio buttons
- **Light Theme:**
  - Icon: Light phone outline (24dp)
  - Label: "Light" (16sp, regular)
  - Radio Button: Blue when selected
- **Dark Theme:**
  - Icon: Dark phone outline (24dp)
  - Label: "Dark" (16sp, regular)
  - Radio Button: Blue when selected

### Language Section

#### Section Header
- **Text:** "Language"
- **Typography:** 18sp, bold, dark gray (#424242)
- **Margin:** 24dp top, 16dp bottom

#### Language Selection
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Language" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Navigation to language selection screen

**Language Selection Screen:**
- **Title:** "Change Language" (20sp, bold)
- **Options:** Vertical list with radio buttons
- **English:**
  - Label: "English" (16sp, regular)
  - Radio Button: Blue when selected
- **Swahili:**
  - Label: "Swahili" (16sp, regular)
  - Radio Button: Blue when selected

### Security Section

#### Section Header
- **Text:** "Security"
- **Typography:** 18sp, bold, dark gray (#424242)
- **Margin:** 24dp top, 16dp bottom

#### Change PIN
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Change PIN" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Opens PIN change modal

**PIN Change Modal:**
- **Title:** "Enter your old PIN" (20sp, bold, center-aligned)
- **PIN Indicators:** 4 horizontal circles (same as authentication)
- **Numeric Keypad:** 3x4 grid layout (same design as authentication)
- **Button Specifications:** Same as authentication keypad

#### Biometric ID
- **Layout:** Horizontal layout with label and toggle switch
- **Label:** "Biometric ID" (16sp, regular, dark gray)
- **Toggle Switch:** Same specifications as notification toggle
- **Action:** When enabled, shows terms agreement modal

### About Section

#### Section Header
- **Text:** "About"
- **Typography:** 18sp, bold, dark gray (#424242)
- **Margin:** 24dp top, 16dp bottom

#### Terms of Use
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Terms Of Use" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Navigation to terms of use screen

**Terms of Use Screen:**
- **Title:** "NMB Mkononi Terms of Use" (18sp, bold, center-aligned)
- **Content:** Scrollable text content in white card
- **Typography:** 14sp, regular, justified text
- **Sections:** 
  - Privacy statement introduction
  - Data Security (orange section header)
  - Information collection and usage
  - Changes to privacy statement (orange section header)
- **Key Information:** Email contact (hudumakwawateja@nmbbank.co.tz)

### Devices Section

#### Section Header
- **Text:** "Devices"
- **Typography:** 18sp, bold, dark gray (#424242)
- **Margin:** 24dp top, 16dp bottom

#### Linked Devices
- **Layout:** Horizontal layout with label and chevron
- **Label:** "Linked Devices" (16sp, regular, dark gray)
- **Chevron:** Right-pointing arrow (16dp, medium gray)
- **Action:** Navigation to linked devices screen

**Linked Devices Screen:**
- **Device Cards:** White cards with device information
- **Card Layout:**
  - **Icon:** Orange device icon (32dp) - SIM card or phone icon
  - **Primary Text:** Device identifier (16sp, bold)
  - **Secondary Text:** Last used date (14sp, regular, gray)
  - **Status:** Colored status text (ACTIVE: orange, BLOCKED: red, ARCHIVED: gray)

**Device Types:**
- **SIM Card:** Grid icon, masked number display
- **Apple iPhone:** Phone icon, device name
- **Status Variations:** ACTIVE, BLOCKED, ARCHIVED

#### Logout
- **Layout:** Horizontal layout with label and logout icon
- **Label:** "Logout" (16sp, regular, orange #FF6B35)
- **Icon:** Power/logout icon (16dp, orange)
- **Action:** Logout confirmation and app exit

### Footer Information
- **App Version:** "App Version 5.5.71"
- **Typography:** 12sp, regular, medium gray
- **Position:** Bottom center, 16dp margin

### Responsive Design Considerations
**Small Screens (<360dp width):**
- Reduce padding and margins proportionally
- Maintain minimum 44dp touch targets
- Stack modal content vertically if needed

**Large Screens (>400dp width):**
- Increase padding for better visual balance
- Consider larger modal widths with max constraints
- Maintain proportional spacing

**Landscape Orientation:**
- Compress header height
- Ensure modal content fits within viewport
- Maintain scrollability for long content sections

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final settingsStateProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(ref.read(settingsRepositoryProvider)),
);

final notificationSettingsProvider = StateProvider<bool>((ref) => true);

final biometricSettingsProvider = StateProvider<bool>((ref) => false);

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

final languageProvider = StateProvider<Locale>((ref) => Locale('en'));

final emailModalProvider = StateProvider<bool>((ref) => false);

final themeModalProvider = StateProvider<bool>((ref) => false);

final pinChangeModalProvider = StateProvider<bool>((ref) => false);
```

### State Classes
```dart
// Settings States
abstract class SettingsState {}
class SettingsInitial extends SettingsState {}
class SettingsLoading extends SettingsState {}
class SettingsLoaded extends SettingsState {
  final UserSettings settings;
  SettingsLoaded(this.settings);
}
class SettingsUpdating extends SettingsState {}
class SettingsUpdateSuccess extends SettingsState {
  final UserSettings updatedSettings;
  SettingsUpdateSuccess(this.updatedSettings);
}
class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
}

// Settings Notifier
class SettingsNotifier extends StateNotifier<SettingsState> {
  final SettingsRepository _settingsRepository;
  
  SettingsNotifier(this._settingsRepository) : super(SettingsInitial()) {
    loadSettings();
  }
  
  Future<void> loadSettings() async {
    state = SettingsLoading();
    try {
      final settings = await _settingsRepository.getUserSettings();
      state = SettingsLoaded(settings);
    } catch (e) {
      state = SettingsError(e.toString());
    }
  }
  
  Future<void> updateNotificationSettings(bool enabled) async {
    await _updateSetting('notifications', enabled);
  }
  
  Future<void> updateBiometricSettings(bool enabled) async {
    await _updateSetting('biometric', enabled);
  }
  
  Future<void> updateTheme(ThemeMode theme) async {
    await _updateSetting('theme', theme.index);
  }
  
  Future<void> updateLanguage(Locale locale) async {
    await _updateSetting('language', locale.languageCode);
  }
  
  Future<void> updateEmail(String email) async {
    await _updateSetting('email', email);
  }
  
  Future<void> _updateSetting(String key, dynamic value) async {
    if (state is SettingsLoaded) {
      state = SettingsUpdating();
      try {
        final updatedSettings = await _settingsRepository.updateSetting(key, value);
        state = SettingsUpdateSuccess(updatedSettings);
        Future.delayed(Duration(seconds: 1), () {
          state = SettingsLoaded(updatedSettings);
        });
      } catch (e) {
        state = SettingsError(e.toString());
      }
    }
  }
}
```

### Data Models
```dart
class UserSettings {
  final bool notificationsEnabled;
  final bool biometricEnabled;
  final ThemeMode theme;
  final Locale language;
  final String? email;
  final List<LinkedDevice> linkedDevices;
  final DateTime lastUpdated;
  
  const UserSettings({
    required this.notificationsEnabled,
    required this.biometricEnabled,
    required this.theme,
    required this.language,
    this.email,
    required this.linkedDevices,
    required this.lastUpdated,
  });
  
  UserSettings copyWith({
    bool? notificationsEnabled,
    bool? biometricEnabled,
    ThemeMode? theme,
    Locale? language,
    String? email,
    List<LinkedDevice>? linkedDevices,
    DateTime? lastUpdated,
  }) {
    return UserSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      email: email ?? this.email,
      linkedDevices: linkedDevices ?? this.linkedDevices,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class LinkedDevice {
  final String deviceId;
  final String deviceName;
  final DeviceType deviceType;
  final DateTime lastUsed;
  final DeviceStatus status;
  final String? maskedIdentifier;
  
  const LinkedDevice({
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.lastUsed,
    required this.status,
    this.maskedIdentifier,
  });
}

enum DeviceType { simCard, iPhone, android, other }

enum DeviceStatus { active, blocked, archived }

class PinChangeRequest {
  final String oldPin;
  final String newPin;
  final String confirmPin;
  
  const PinChangeRequest({
    required this.oldPin,
    required this.newPin,
    required this.confirmPin,
  });
}
```

### API Requirements
**Settings Management:**
- GET `/api/v1/user/settings` - Get user settings and preferences
- PUT `/api/v1/user/settings` - Update user settings
- POST `/api/v1/user/settings/notification` - Update notification preferences
- PUT `/api/v1/user/settings/theme` - Update theme preference
- PUT `/api/v1/user/settings/language` - Update language preference

**Security Settings:**
- POST `/api/v1/security/pin/change` - Change user PIN
- PUT `/api/v1/security/biometric` - Enable/disable biometric authentication
- GET `/api/v1/security/devices` - Get linked devices
- DELETE `/api/v1/security/devices/{deviceId}` - Remove linked device

**Profile Settings:**
- PUT `/api/v1/user/email` - Update user email address
- GET `/api/v1/user/profile/settings` - Get profile-related settings

**App Information:**
- GET `/api/v1/app/terms` - Get terms of use content
- GET `/api/v1/app/version` - Get current app version information
- POST `/api/v1/auth/logout` - Logout user and invalidate session

### Error Handling
**Network Errors:**
- **Connection Issues:** Show cached settings with refresh option
- **Timeout:** Retry mechanism with user feedback
- **Server Errors:** Graceful degradation with error messages

**Validation Errors:**
- **Invalid Email:** Real-time email format validation
- **PIN Requirements:** Clear feedback on PIN strength requirements
- **Setting Conflicts:** Handle conflicting settings gracefully

**Security Errors:**
- **PIN Change Failed:** Clear error messaging with retry options
- **Biometric Setup Failed:** Alternative authentication options
- **Device Management Errors:** Clear status indicators and retry mechanisms

## 5. Interactions & Animations

### Micro-interactions
**Toggle Switches:**
- **Animation:** Smooth thumb slide animation (200ms)
- **Haptic Feedback:** Light impact when toggling
- **Visual Feedback:** Immediate color change and thumb position

**Setting Cards:**
- **Tap Animation:** Scale down to 0.98x for 100ms
- **Hover State:** Subtle elevation increase (2dp to 4dp)
- **Loading State:** Subtle shimmer animation during updates

**Modal Presentations:**
- **Entry Animation:** Modal slides up from bottom or fades in from center
- **Overlay:** Background dims with fade animation
- **Exit Animation:** Reverse entry animation

### Transitions
**Screen Navigation:**
- **Settings Entry:** Slide in from right (300ms)
- **Category Navigation:** Push transition to sub-screens
- **Modal Transitions:** Appropriate modal presentation based on content type

**Setting Updates:**
- **Immediate Feedback:** Optimistic updates with rollback on error
- **Success Animation:** Brief checkmark or color flash
- **Error Animation:** Shake animation with error state indication

**Theme Changes:**
- **Smooth Transition:** Gradual color transition across app (400ms)
- **Element Updates:** All UI elements update simultaneously
- **Persistence:** Theme change persists immediately

### Loading States
**Settings Load:**
- **Progressive Loading:** Load categories in order of priority
- **Skeleton Screen:** Show layout structure with placeholders
- **Error States:** Clear error indication with retry options

**Setting Updates:**
- **Button Loading:** Loading spinner in buttons during updates
- **Toggle Loading:** Brief loading state for toggle switches
- **Optimistic Updates:** Show change immediately with confirmation

### Feedback Mechanisms
**Haptic Feedback:**
- **Toggle Changes:** Light impact for setting toggles
- **Modal Presentation:** Light impact when opening modals
- **Error States:** Error haptic pattern for validation failures

**Visual Feedback:**
- **Setting Changes:** Immediate visual confirmation
- **Success States:** Green checkmark or color confirmation
- **Error States:** Red color indication with clear messaging

**Audio Feedback (Optional):**
- **Toggle Sounds:** Subtle click sounds for toggles (user preference)
- **Modal Sounds:** Soft presentation sounds for modals
- **Error Sounds:** Gentle error tones for validation failures

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Setting Labels:** Clear semantic labels for all settings
- **Toggle States:** Announce current state and changes
- **Modal Content:** Proper focus management and content description
- **Navigation:** Logical reading order and focus progression

**Motor Accessibility:**
- **Touch Targets:** All interactive elements minimum 44dp
- **Toggle Switches:** Large enough targets for easy manipulation
- **Alternative Input:** Support for external keyboards and switch controls
- **Voice Control:** Voice command support for common settings

**Visual Accessibility:**
- **High Contrast:** Support system high contrast mode
- **Text Scaling:** Support up to 200% text scaling
- **Color Independence:** Information not conveyed by color alone
- **Focus Indicators:** Clear focus indicators for keyboard navigation

**Cognitive Accessibility:**
- **Clear Grouping:** Logical organization of settings categories
- **Simple Language:** Clear, concise labels and descriptions
- **Undo Options:** Allow users to revert changes easily
- **Confirmation:** Clear confirmation for significant changes

### Performance Considerations
**Load Time Optimization:**
- **Settings Caching:** Cache user settings locally for quick access
- **Progressive Loading:** Load settings categories in priority order
- **Background Sync:** Sync settings changes in background

**Memory Management:**
- **Efficient State:** Minimal memory footprint for settings state
- **Modal Cleanup:** Proper cleanup when modals are dismissed
- **Image Optimization:** Efficient loading of device icons and graphics

**Network Efficiency:**
- **Batched Updates:** Group settings changes for efficient API calls
- **Offline Support:** Allow settings viewing and some changes offline
- **Delta Sync:** Only sync changed settings to reduce bandwidth

### Testing Requirements
**Unit Tests:**
- **State Management:** Test all settings state transitions
- **Validation Logic:** Test input validation and error handling
- **Business Logic:** Test settings update logic and persistence
- **Error Scenarios:** Test all error conditions and recovery

**Widget Tests:**
- **Settings Rendering:** Test settings screen rendering
- **Modal Interactions:** Test modal presentation and dismissal
- **Toggle Functionality:** Test switch and radio button interactions
- **Form Validation:** Test input validation and error display

**Integration Tests:**
- **Full Settings Flow:** End-to-end settings management
- **API Integration:** Test settings API calls and responses
- **Cross-Screen Updates:** Verify settings changes reflect throughout app
- **Logout Flow:** Test complete logout process and cleanup

**Accessibility Tests:**
- **Screen Reader:** Test with VoiceOver/TalkBack
- **Keyboard Navigation:** Test navigation without touch
- **High Contrast:** Test visibility in high contrast mode
- **Voice Control:** Test voice command functionality

## 7. Future Enhancements

### Planned Improvements
**Advanced Personalization:**
- **Custom Themes:** User-created color themes and customization
- **Dashboard Layouts:** Multiple dashboard layout options
- **Notification Granularity:** Fine-grained notification controls
- **Accessibility Enhancements:** Advanced accessibility customization options

**Enhanced Security:**
- **Two-Factor Authentication:** SMS and authenticator app support
- **Device Trust Levels:** Different security levels for different devices
- **Session Management:** Advanced session control and monitoring
- **Security Alerts:** Real-time security notifications and alerts

**Smart Features:**
- **Adaptive Settings:** AI-driven settings suggestions based on usage
- **Contextual Settings:** Location and time-based setting adjustments
- **Usage Analytics:** Personal usage insights and optimization suggestions
- **Smart Notifications:** Intelligent notification timing and content

**Administrative Features:**
- **Family Controls:** Parental controls and family account management
- **Business Settings:** Enterprise features for business accounts
- **Backup & Restore:** Settings backup and restore across devices
- **Advanced Privacy:** Granular privacy controls and data management

### Technical Debt Considerations
**Architecture Improvements:**
- **Settings Service:** Centralized settings management service
- **State Optimization:** More efficient state management for complex settings
- **API Consolidation:** Streamlined settings API with better caching
- **Performance Monitoring:** Detailed performance tracking for settings operations

**User Experience:**
- **Settings Search:** Search functionality for finding specific settings
- **Quick Settings:** Widget or shortcut for frequently changed settings
- **Settings Wizard:** Guided setup for new users
- **Help Integration:** Contextual help and tooltips for settings

**Maintainability:**
- **Settings Schema:** Formal schema for settings validation and migration
- **Documentation:** Comprehensive documentation for all settings options
- **Testing Framework:** Enhanced automated testing for settings functionality
- **Internationalization:** Complete localization support for all settings content

**Scalability:**
- **Cloud Sync:** Enhanced cloud synchronization across multiple devices
- **Feature Flags:** Dynamic feature enablement for settings
- **A/B Testing:** Framework for testing different settings interfaces
- **Analytics Integration:** Comprehensive analytics for settings usage and optimization