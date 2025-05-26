# Onboarding - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The onboarding feature introduces new users to the NMB Mobile app through an engaging carousel of promotional content and services. This feature serves as the bridge between app launch and user authentication, showcasing key banking services, promotions, and lifestyle benefits.

### User Personas and Use Cases
**Primary Users:**
- **First-time users:** New customers downloading the app for the first time
- **Existing customers:** Returning users who need to re-authenticate after app updates or security timeouts
- **Potential customers:** Users exploring the app's capabilities before signing up

**Use Cases:**
- Discover available banking services and features
- Learn about current promotions and offers (10% cashback, Fantasy League, etc.)
- Understand the value proposition of digital banking with NMB
- Seamlessly transition to authentication flow
- Access Quick Services without full authentication

### Business Requirements
- Promote key NMB services (Lipa Mkononi, Fantasy League, mobile payments)
- Drive user engagement with promotional content
- Reduce authentication friction with contextual content
- Support multiple languages (Swahili primary, English secondary)
- Showcase lifestyle benefits of mobile banking
- Provide quick access to essential services

## 2. User Journey

### Entry Points
- **App Launch:** Fresh install or app restart
- **Session Timeout:** After security timeout requiring re-authentication
- **Manual Logout:** User-initiated logout requiring re-entry

### User Flow
```
App Launch → Splash Screen → Onboarding Carousel → PIN Authentication → Dashboard
                              ↑                    ↓
                              ←── Swipe Navigation ←──
                                    Quick Services
```

### Navigation Patterns
- **Automatic Progression:** Slides can auto-advance every 5 seconds (optional)
- **Manual Navigation:** Users swipe left/right to navigate slides
- **Page Indicators:** Visual dots showing current slide position (3 orange dots + 1 gray for 4 slides)
- **Skip Option:** Quick Services link provides bypass to limited functionality
- **Authentication Overlay:** PIN input overlays the current slide content

### Exit Points
- **Successful Authentication:** Direct to Dashboard
- **Quick Services:** Limited functionality without full auth
- **App Minimization:** Preserve current slide position

## 3. Visual Design

### Layout Structure
**Screen Composition (Vertical):**
- **Background Layer (0-100%):** Full-screen promotional background images
- **Authentication Overlay (60-100%):** White rounded container with PIN interface
- **Content Distribution:** 60% promotional background, 40% authentication interface

### Background Image System
**Implementation Approach:**
- Each slide is a complete graphic image created by the design/marketing team
- Images contain all promotional content (text, logos, people, branding)
- Flutter implementation simply displays the image as a full-screen background
- No text overlays or programmatic content positioning required

**Image Specifications:**
- **Format:** PNG or WebP for quality, JPEG for smaller file sizes
- **Resolution:** Multiple densities (1x, 2x, 3x) for different screen sizes
- **Aspect Ratio:** Designed for mobile screens (9:16 or similar)
- **File Naming:** `onboarding_slide_01.png`, `onboarding_slide_02.png`, etc.

### Slide Content Overview
**Note:** All visual elements described below are baked into the promotional images

#### Slide 1: Banking Services Promotion
**Image Content:**
- Blue gradient background with floating decorative elements
- "ONJA UNOGEWE!" headline in bold orange text
- "*Teleza Kidigitali" subline and additional promotional text
- "10%" percentage highlight prominently displayed
- Lipa Mkononi branding and NMB card visuals
- Two people in celebratory poses (promotional lifestyle imagery)

#### Slide 2: Shopping Experience
**Image Content:**
- Young woman with shopping bags against blue background
- Decorative floating elements (circles and shapes)
- Lifestyle-focused promotional imagery
- Consistent blue and orange branding elements

#### Slide 3: Mobile Payments & Mobility
**Image Content:**
- Man on motorcycle with smartphone in urban setting
- Street scene with colorful buildings
- Mobile-first lifestyle representation
- Consistent brand color scheme and decorative elements

#### Slide 4: Fantasy Sports Promotion
**Image Content:**
- "MWENYE KIKOSI BORA ASHINDEE!" headline text
- Prize information and promotional details
- GO Fantasy League branding with football theme
- Football player in confident pose
- Consistent blue background with brand elements

#### Slide 5: Social & Lifestyle
**Image Content:**
- Woman enjoying ice cream/popsicle
- Social and leisure lifestyle representation
- Warm, friendly atmosphere
- Consistent brand colors and decorative styling

### Component Specifications

#### Page Indicators
- **Position:** Horizontal center, 24dp above PIN input area
- **Active State:** Orange circle (#FF6B35), 8dp diameter
- **Inactive State:** Light gray circle (#E0E0E0), 8dp diameter
- **Spacing:** 12dp between indicators
- **Animation:** Smooth transition (200ms) on slide change

#### Authentication Container
- **Background:** White (#FFFFFF)
- **Corner Radius:** Top corners 24dp, bottom corners 0dp
- **Elevation:** 8dp shadow
- **Padding:** 24dp horizontal, 32dp vertical
- **Min Height:** 40% of screen height

### Responsive Design Considerations
- **Small Screens (<360dp width):** Reduce text sizes by 10%, adjust spacing
- **Large Screens (>400dp width):** Maintain proportions, increase spacing
- **Landscape Orientation:** Reduce background content height, expand auth container
- **Text Scaling:** Support system accessibility text scaling up to 200%

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final onboardingStateProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(),
);

final slideIndexProvider = StateProvider<int>((ref) => 0);

final autoAdvanceProvider = StateProvider<bool>((ref) => true);
```

### State Classes
```dart
abstract class OnboardingState {}
class OnboardingInitial extends OnboardingState {}
class OnboardingSlideChanged extends OnboardingState {
  final int currentSlide;
  final int totalSlides;
  OnboardingSlideChanged(this.currentSlide, this.totalSlides);
}
class OnboardingCompleted extends OnboardingState {}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingInitial());
  
  void changeSlide(int index) {
    state = OnboardingSlideChanged(index, 5);
  }
  
  void completeOnboarding() {
    state = OnboardingCompleted();
  }
}
```

### Data Models
```dart
class OnboardingSlide {
  final String id;
  final String backgroundImagePath;
  final String? altText; // For accessibility
  final int order;
  final bool isActive;
  
  const OnboardingSlide({
    required this.id,
    required this.backgroundImagePath,
    this.altText,
    required this.order,
    this.isActive = true,
  });
}

// Example usage
final List<OnboardingSlide> onboardingSlides = [
  OnboardingSlide(
    id: 'banking_promotion',
    backgroundImagePath: 'assets/images/onboarding_slide_01.png',
    altText: 'Banking services promotion with cashback offers',
    order: 1,
  ),
  OnboardingSlide(
    id: 'shopping_experience',
    backgroundImagePath: 'assets/images/onboarding_slide_02.png',
    altText: 'Woman with shopping bags representing mobile commerce',
    order: 2,
  ),
  // ... additional slides
];
```
```

### API Requirements
**Content Management:**
- GET `/api/v1/onboarding/slides` - Fetch current slide configuration
- Response includes slide order, image URLs, and metadata
- Support for A/B testing different slide variations
- Remote configuration for enabling/disabling specific slides

**Image Assets:**
- CDN delivery for optimized image loading
- Multiple resolution support (1x, 2x, 3x)
- Progressive image loading with low-quality placeholders
- Cache headers for efficient image caching

**Analytics Tracking:**
- POST `/api/v1/analytics/onboarding` - Track slide interactions
- Events: slide_viewed, slide_completed, quick_services_accessed
- Duration tracking for optimization

### Error Handling
- **Network Failures:** Fall back to bundled slide images in assets folder
- **Image Loading Errors:** Show branded color background with loading indicator
- **Image Loading Delays:** Display low-quality placeholder while loading full resolution
- **Malformed API Response:** Skip problematic slide configurations, log errors for monitoring
- **Missing Image Assets:** Fall back to default promotional background

## 5. Interactions & Animations

### Micro-interactions
**Slide Transitions:**
- **Gesture:** Horizontal swipe (minimum 50dp movement)
- **Animation:** Slide transition with 300ms duration
- **Easing:** Cubic bezier curve for natural feel
- **Resistance:** Slight bounce at first/last slide

**Page Indicators:**
- **Scale Animation:** Active indicator scales 1.2x on selection
- **Color Transition:** 200ms fade between active/inactive states
- **Anticipation:** Slight scale before transition

### Transitions
**Between Slides:**
- **Type:** Horizontal slide with parallax effect on background elements
- **Duration:** 300ms
- **Easing:** `Curves.easeInOutCubic`
- **Background Elements:** Move at 0.7x speed for depth

**Auto-Advance:**
- **Interval:** 5 seconds per slide
- **Pause Conditions:** User interaction, app backgrounded, authentication active
- **Resume:** Continue after interaction ends
- **Indicator:** Subtle progress ring around active indicator

### Loading States
**Initial Load:**
- **Placeholder Images:** Show low-quality placeholder while loading full resolution
- **Progressive Loading:** Load images in order of priority (current slide first)
- **Smooth Transitions:** Fade in images once fully loaded

**Content Updates:**
- **Background Refresh:** Update slide images without disrupting user experience
- **Cache Strategy:** Preload next slide image for smooth transitions
- **Fallback Strategy:** Always maintain bundled assets as fallback

### Feedback Mechanisms
**User Actions:**
- **Haptic Feedback:** Light impact on slide change
- **Visual Feedback:** Brief highlight on page indicator
- **Audio Feedback:** Optional subtle sound effects (user preference)

**System Feedback:**
- **Connection Status:** Subtle indicator for offline/online state
- **Loading Progress:** Progress indicator for slow networks
- **Error States:** Non-intrusive error messages with retry options

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Content Announcements:** Announce slide changes and content
- **Navigation Hints:** Clear instructions for slide navigation
- **Focus Management:** Proper focus handling for auth overlay

**Motor Accessibility:**
- **Touch Targets:** Minimum 44dp touch areas for all interactive elements
- **Gesture Alternatives:** Voice commands and external switch support
- **Timing:** User control over auto-advance timing

**Visual Accessibility:**
- **High Contrast:** Alternative high-contrast mode
- **Text Scaling:** Support up to 200% system text scaling
- **Color Independence:** Information not conveyed by color alone
- **Motion Sensitivity:** Respect user's reduced motion preferences

### Performance Considerations
**Image Optimization:**
- **Multiple Densities:** 1x, 2x, 3x assets for different screen densities
- **Format Optimization:** WebP format with JPEG fallback
- **Lazy Loading:** Load images for current and next slide only
- **Compression:** Aggressive compression with quality monitoring

**Memory Management:**
- **Slide Recycling:** Dispose of off-screen slide resources
- **Image Caching:** Smart caching with size limits
- **Animation Efficiency:** Use Transform widgets for hardware acceleration

**Network Efficiency:**
- **Content Prefetching:** Download slide content on WiFi
- **Progressive Loading:** Core content first, enhancements second
- **Offline Support:** Cached content for offline viewing

### Testing Requirements
**Unit Tests:**
- State management logic
- Slide navigation functions
- Content parsing and validation
- Error handling scenarios

**Widget Tests:**
- Slide rendering with different content types
- Navigation gesture handling
- Accessibility widget interactions
- Responsive layout at different screen sizes

**Integration Tests:**
- Full onboarding flow completion
- Authentication transition
- Network failure recovery
- Performance under various conditions

## 7. Future Enhancements

### Planned Improvements
**Personalization:**
- **Dynamic Slide Selection:** Choose which promotional images to show based on user behavior
- **Location-Based:** Regional promotional images and campaigns
- **Time-Sensitive:** Holiday and seasonal promotional backgrounds
- **User Segmentation:** Different slide sets for different user types

**Content Management:**
- **Remote Image Updates:** Update promotional images without app store releases
- **Campaign Management:** Schedule and manage promotional campaigns
- **Performance Analytics:** Track which promotional images drive most engagement
- **Real-time Updates:** Push new promotional content based on current campaigns

**Interactive Elements:**
- **Embedded Videos:** Short promotional videos within slides
- **Interactive Hotspots:** Tappable areas for more information
- **Mini-Games:** Gamified elements to increase engagement
- **Live Content:** Real-time data integration (exchange rates, offers)

**Advanced Features:**
- **Voice Narration:** Audio descriptions of slide content
- **AR Elements:** Augmented reality previews of services
- **Social Integration:** Share promotional content with friends
- **Progressive Web App:** Web version of onboarding experience

### Technical Debt Considerations
**Code Organization:**
- **Widget Decomposition:** Break down large onboarding widgets into smaller, reusable components
- **State Management:** Consider more sophisticated state management for complex interactions
- **Asset Management:** Implement automated asset optimization pipeline

**Performance Optimization:**
- **Bundle Size:** Optimize app size by lazy-loading non-critical onboarding assets
- **Animation Performance:** Profile and optimize animations for older devices
- **Memory Leaks:** Regular profiling and cleanup of resources

**Maintainability:**
- **Content Management System:** Move to headless CMS for easier content updates
- **Internationalization:** Implement proper i18n system for multiple languages
- **Analytics Integration:** More sophisticated user behavior tracking and analysis

**Scalability:**
- **A/B Testing Framework:** Infrastructure for testing different onboarding variations
- **Feature Flags:** Dynamic feature enablement without app updates
- **Cloud Configuration:** Remote configuration for slide content and behavior