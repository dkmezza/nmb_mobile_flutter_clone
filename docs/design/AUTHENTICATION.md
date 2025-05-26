# Authentication - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The authentication feature provides secure user access to the NMB Mobile app through PIN-based authentication. This feature overlays the onboarding carousel and serves as the primary security gateway for accessing banking services. The authentication interface is designed to be contextual, appearing over promotional content while maintaining security and usability.

### User Personas and Use Cases
**Primary Users:**
- **Existing Bank Customers:** Users with established NMB accounts and configured PINs
- **New Mobile Users:** Customers transitioning from traditional banking to mobile
- **Security-Conscious Users:** Users requiring quick but secure access to banking services
- **Frequent Users:** Customers who access the app multiple times daily

**Use Cases:**
- **Primary Authentication:** Secure login to access full banking services
- **Re-authentication:** Session renewal after timeout or app backgrounding
- **Quick Access:** Fast authentication for frequent transactions
- **Security Verification:** Additional verification for sensitive operations
- **Fallback Authentication:** Alternative when biometric authentication fails

### Business Requirements
- Maintain high security standards with 4-digit PIN verification
- Provide quick and intuitive authentication experience
- Support multiple authentication attempts with appropriate security measures
- Enable quick access to limited services without full authentication
- Maintain session security while preserving user convenience
- Support accessibility requirements for diverse user abilities
- Implement proper error handling and security feedback

## 2. User Journey

### Entry Points
- **App Launch:** Primary authentication after onboarding slides
- **Session Timeout:** Re-authentication after inactivity (typically 5-15 minutes)
- **App Backgrounding:** Re-authentication after app returns from background (security policy dependent)
- **Security Triggers:** Additional verification for high-value transactions
- **Manual Lock:** User-initiated security lock requiring re-authentication

### User Flow
```
Onboarding Slide → PIN Authentication Overlay → [Success/Failure] → Dashboard/Error
     ↑                      ↓                           ↓
     ←── Back to Slides ←── Quick Services ←── Limited Access
```

### Navigation Patterns
- **Overlay Interaction:** Authentication container slides up from bottom 60% of screen
- **Dismissal:** No dismiss option for primary authentication (security requirement)
- **Quick Services:** Alternative path for limited functionality without full authentication
- **Error Recovery:** Clear error states with retry mechanisms
- **Success Transition:** Smooth transition to main dashboard upon successful authentication

### Exit Points
- **Successful Authentication:** Direct transition to main dashboard
- **Quick Services Access:** Limited functionality without full authentication
- **Maximum Attempts Exceeded:** Security lockout with recovery options
- **App Exit:** User exits app during authentication (security consideration)

## 3. Visual Design

### Layout Structure
**Authentication Container Specifications:**
- **Position:** Bottom 40% of screen, overlaying promotional background
- **Background:** Pure white (#FFFFFF) with subtle shadow
- **Corner Radius:** Top corners 24dp, bottom corners 0dp (flush with screen edge)
- **Elevation:** 8dp shadow for clear separation from background
- **Padding:** 24dp horizontal, 32dp vertical
- **Min Height:** 320dp to accommodate all elements comfortably

### Component Hierarchy (Top to Bottom)
1. **User Greeting Section**
2. **PIN Instruction Text**
3. **PIN Input Indicators**
4. **Numeric Keypad**
5. **Quick Services Link**

### User Greeting Section
**Layout:**
- **Primary Text:** "Hi, David" (personalized with user's first name)
- **Typography:** 20sp, medium weight, dark gray (#424242)
- **Positioning:** Left-aligned, 16dp from container top
- **Personalization:** Dynamic first name from user profile

### PIN Instruction Text
**Layout:**
- **Text:** "Kindly enter your Mkononi PIN"
- **Typography:** 14sp, regular weight, medium gray (#9E9E9E)
- **Positioning:** Left-aligned, 8dp below greeting
- **Tone:** Polite and instructional

### PIN Input Indicators
**Visual Specifications:**
- **Count:** 4 circular indicators representing 4-digit PIN
- **Layout:** Horizontal row, center-aligned
- **Spacing:** 16dp between each circle
- **Margin:** 32dp from instruction text, 24dp from keypad

**State Specifications:**
- **Empty State:** 
  - Border: 2dp light gray (#E0E0E0)
  - Background: Transparent
  - Size: 16dp diameter
- **Filled State:**
  - Background: Orange (#FF6B35)
  - Border: None
  - Size: 16dp diameter
- **Error State:**
  - Border: 2dp red (#F44336)
  - Background: Light red (#FFEBEE)
  - Animation: Shake animation (200ms)

### Numeric Keypad
**Grid Layout:**
- **Configuration:** 3x4 grid (3 columns, 4 rows)
- **Button Spacing:** 16dp horizontal and vertical gaps
- **Container Width:** Full width minus 24dp padding on each side

**Button Specifications:**
- **Size:** 72x72dp circular buttons
- **Background:** Primary blue (#1E4A8C)
- **Text Color:** White (#FFFFFF)
- **Typography:** 24sp, medium weight
- **Corner Radius:** 36dp (perfect circle)
- **Elevation:** 2dp for subtle depth

**Button Layout:**
```
[1] [2] [3]
[4] [5] [6]
[7] [8] [9]
    [0] [×]
```

**Special Buttons:**
- **Delete Button (×):** 
  - Background: Orange (#FF6B35)
  - Icon: White "×" symbol (18sp)
  - Position: Bottom right
  - Function: Remove last entered digit

**Button States:**
- **Normal:** Default blue background
- **Pressed:** Darker blue (#1A3F7A) with scale animation (0.95x)
- **Disabled:** Light gray (#BDBDBD) with reduced opacity

### Quick Services Link
**Specifications:**
- **Text:** "Quick Services"
- **Typography:** 16sp, medium weight, primary blue (#1E4A8C)
- **Icon:** Small service icon (16dp) to the left of text
- **Position:** Bottom center of container, 16dp from container bottom
- **Interaction:** Underline on press, navigation to limited services

### Responsive Design Considerations
**Small Screens (<360dp width):**
- Reduce PIN button size to 64x64dp
- Adjust spacing between elements proportionally
- Maintain minimum 44dp touch targets

**Large Screens (>400dp width):**
- Maintain button sizes and spacing as specified
- Center content within wider containers
- Increase padding for better visual balance

**Landscape Orientation:**
- Compress vertical spacing
- Maintain button sizes and core functionality
- Ensure full interface remains visible

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authRepositoryProvider)),
);

final pinInputProvider = StateNotifierProvider<PinInputNotifier, PinInputState>(
  (ref) => PinInputNotifier(),
);

final authAttemptsProvider = StateProvider<int>((ref) => 0);

final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  return ref.read(userRepositoryProvider).getCurrentUser();
});
```

### State Classes
```dart
// Authentication States
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserProfile user;
  AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String message;
  final int attemptsRemaining;
  AuthFailure(this.message, this.attemptsRemaining);
}
class AuthLocked extends AuthState {
  final DateTime lockUntil;
  AuthLocked(this.lockUntil);
}

// PIN Input States
abstract class PinInputState {}
class PinInputInitial extends PinInputState {}
class PinInputInProgress extends PinInputState {
  final List<int> enteredDigits;
  PinInputInProgress(this.enteredDigits);
}
class PinInputComplete extends PinInputState {
  final String pin;
  PinInputComplete(this.pin);
}
class PinInputError extends PinInputState {
  final String message;
  PinInputError(this.message);
}

// Notifier Classes
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  
  AuthNotifier(this._authRepository) : super(AuthInitial());
  
  Future<void> authenticateWithPin(String pin) async {
    state = AuthLoading();
    try {
      final user = await _authRepository.authenticateWithPin(pin);
      state = AuthSuccess(user);
    } catch (e) {
      final attempts = await _authRepository.getFailedAttempts();
      if (attempts >= 3) {
        state = AuthLocked(DateTime.now().add(Duration(minutes: 15)));
      } else {
        state = AuthFailure(e.toString(), 3 - attempts);
      }
    }
  }
}

class PinInputNotifier extends StateNotifier<PinInputState> {
  PinInputNotifier() : super(PinInputInitial());
  
  void addDigit(int digit) {
    if (state is PinInputInProgress) {
      final current = (state as PinInputInProgress).enteredDigits;
      if (current.length < 4) {
        final updated = [...current, digit];
        if (updated.length == 4) {
          state = PinInputComplete(updated.join());
        } else {
          state = PinInputInProgress(updated);
        }
      }
    } else {
      state = PinInputInProgress([digit]);
    }
  }
  
  void removeDigit() {
    if (state is PinInputInProgress) {
      final current = (state as PinInputInProgress).enteredDigits;
      if (current.isNotEmpty) {
        final updated = current.sublist(0, current.length - 1);
        if (updated.isEmpty) {
          state = PinInputInitial();
        } else {
          state = PinInputInProgress(updated);
        }
      }
    }
  }
  
  void clearPin() {
    state = PinInputInitial();
  }
  
  void showError(String message) {
    state = PinInputError(message);
    // Auto-clear error after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      if (state is PinInputError) {
        state = PinInputInitial();
      }
    });
  }
}
```

### Data Models
```dart
class UserProfile {
  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String accountNumber;
  final DateTime lastLogin;
  final bool isBiometricEnabled;
  
  const UserProfile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.accountNumber,
    required this.lastLogin,
    required this.isBiometricEnabled,
  });
}

class AuthRequest {
  final String pin;
  final String deviceId;
  final DateTime timestamp;
  final String? biometricSignature;
  
  const AuthRequest({
    required this.pin,
    required this.deviceId,
    required this.timestamp,
    this.biometricSignature,
  });
}

class AuthResponse {
  final bool success;
  final String? accessToken;
  final String? refreshToken;
  final UserProfile? user;
  final int? attemptsRemaining;
  final String? errorMessage;
  final DateTime? lockUntil;
  
  const AuthResponse({
    required this.success,
    this.accessToken,
    this.refreshToken,
    this.user,
    this.attemptsRemaining,
    this.errorMessage,
    this.lockUntil,
  });
}
```

### API Requirements
**Authentication Endpoints:**
- POST `/api/v1/auth/pin` - Authenticate with PIN
- POST `/api/v1/auth/refresh` - Refresh authentication token
- POST `/api/v1/auth/logout` - Logout and invalidate tokens
- GET `/api/v1/auth/status` - Check current authentication status

**Security Endpoints:**
- GET `/api/v1/security/attempts` - Get failed attempt count
- POST `/api/v1/security/unlock` - Request account unlock
- POST `/api/v1/security/reset-pin` - Initiate PIN reset process

**User Profile:**
- GET `/api/v1/user/profile` - Get current user profile
- PUT `/api/v1/user/profile` - Update user profile

### Error Handling
**Network Errors:**
- **Connection Timeout:** Show retry option with exponential backoff
- **No Internet:** Offline mode message with retry when connection restored
- **Server Errors (5xx):** Generic error message with support contact information

**Authentication Errors:**
- **Invalid PIN:** Clear feedback with attempts remaining counter
- **Account Locked:** Clear message with unlock time and recovery options
- **Expired Session:** Automatic re-authentication flow
- **Device Not Recognized:** Additional security verification required

**Input Validation:**
- **PIN Length:** Ensure exactly 4 digits before submission
- **Numeric Only:** Validate that only numbers are accepted
- **Rate Limiting:** Prevent rapid-fire authentication attempts

## 5. Interactions & Animations

### Micro-interactions
**PIN Button Press:**
- **Animation:** Scale down to 0.95x for 100ms, then back to 1.0x
- **Haptic Feedback:** Light impact feedback on each button press
- **Visual Feedback:** Brief color change to darker blue during press

**PIN Indicator Fill:**
- **Animation:** Smooth fill animation (150ms) when digit is entered
- **Easing:** Ease-out curve for natural feel
- **Color Transition:** Fade from transparent to orange

**Delete Button:**
- **Animation:** Same scale animation as number buttons
- **Visual Feedback:** Brief color change to darker orange
- **Indicator Animation:** Smooth empty animation (150ms) when digit removed

### Transitions
**Authentication Container Appearance:**
- **Animation:** Slide up from bottom with slight bounce
- **Duration:** 400ms
- **Easing:** Cubic bezier curve (0.25, 0.46, 0.45, 0.94)
- **Background:** Fade in shadow and overlay simultaneously

**Success Transition:**
- **PIN Indicators:** Brief green flash (200ms) on all indicators
- **Container:** Fade out while sliding down (300ms)
- **Background:** Smooth transition to dashboard
- **Timing:** 500ms total duration before dashboard appears

**Error Animations:**
- **Shake Animation:** Horizontal shake of PIN indicators (200ms)
- **Color Flash:** Brief red flash on indicators (150ms)
- **Reset:** Auto-clear after 1 second with fade animation

### Loading States
**Authentication in Progress:**
- **Visual Indicator:** Loading spinner below PIN indicators
- **Button States:** All buttons disabled with reduced opacity (0.6)
- **Spinner:** Orange loading spinner (24dp) with smooth rotation
- **Duration:** Typically 1-3 seconds for network authentication

**Quick Services Loading:**
- **Link State:** Loading indicator next to Quick Services text
- **Animation:** Small spinner or dots animation
- **Fallback:** Ensure graceful handling if quick services unavailable

### Feedback Mechanisms
**Haptic Feedback:**
- **Button Press:** Light impact for each number button
- **Error:** Medium impact for authentication failure
- **Success:** Success haptic pattern (if available on device)

**Audio Feedback (Optional):**
- **Button Press:** Subtle click sound (user preference)
- **Error:** Error tone (respectful of accessibility needs)
- **Success:** Success chime (user preference)

**Visual Feedback:**
- **Real-time:** Immediate visual response to all user interactions
- **Status Updates:** Clear progress indication during authentication
- **Error States:** Obvious but non-alarming error indication

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Button Labels:** Clear semantic labels for all numeric buttons
- **State Announcements:** Announce PIN entry progress and authentication status
- **Error Messages:** Clear, descriptive error message announcements
- **Navigation:** Logical focus order through authentication interface

**Motor Accessibility:**
- **Touch Targets:** Minimum 44dp touch targets (buttons are 72dp)
- **Button Spacing:** Adequate spacing to prevent accidental presses
- **Alternative Input:** Support for external keyboards and switch controls
- **Gesture Recognition:** Accommodate users with limited fine motor control

**Visual Accessibility:**
- **High Contrast:** Support system high contrast mode
- **Text Scaling:** Support up to 200% system text scaling
- **Color Independence:** Don't rely solely on color for state indication
- **Focus Indicators:** Clear focus indicators for keyboard navigation

**Cognitive Accessibility:**
- **Clear Instructions:** Simple, direct language for all instructions
- **Error Recovery:** Clear guidance on how to resolve authentication errors
- **Timeout Warnings:** Appropriate warnings before session timeouts
- **Consistent Patterns:** Maintain consistent interaction patterns

### Performance Considerations
**Response Time:**
- **Button Feedback:** Immediate visual feedback (<16ms)
- **Local Validation:** Instant PIN length validation
- **Network Calls:** Optimize authentication API calls for speed
- **Caching:** Cache user profile data for faster greeting display

**Memory Management:**
- **State Cleanup:** Proper cleanup of sensitive data from memory
- **Animation Efficiency:** Use efficient animations that don't impact performance
- **Resource Management:** Minimal memory footprint for authentication flow

**Battery Optimization:**
- **Efficient Animations:** Use transform-based animations for GPU acceleration
- **Minimal Processing:** Avoid unnecessary computations during authentication
- **Background Behavior:** Proper handling when app is backgrounded

### Testing Requirements
**Unit Tests:**
- **State Management:** Test all authentication state transitions
- **PIN Validation:** Test PIN input logic and validation
- **Error Handling:** Test all error scenarios and recovery paths
- **Security Logic:** Test attempt counting and lockout behavior

**Widget Tests:**
- **UI Rendering:** Test authentication interface rendering in various states
- **User Interactions:** Test button presses and PIN input flow
- **Accessibility:** Test screen reader compatibility and focus management
- **Responsive Design:** Test layout at different screen sizes

**Integration Tests:**
- **Full Authentication Flow:** End-to-end authentication testing
- **API Integration:** Test authentication API calls and responses
- **Error Scenarios:** Test network failures and error recovery
- **Security Testing:** Test lockout behavior and attempt tracking

**Security Testing:**
- **PIN Storage:** Verify secure handling of PIN data
- **Session Management:** Test token refresh and session expiry
- **Attempt Tracking:** Verify failed attempt counting and reset
- **Data Encryption:** Ensure proper encryption of sensitive data

## 7. Future Enhancements

### Planned Improvements
**Biometric Authentication:**
- **Fingerprint Integration:** TouchID/FingerprintID support as PIN alternative
- **Face Recognition:** FaceID support where available
- **Voice Recognition:** Future voice authentication capability
- **Multi-factor:** Combine biometric with PIN for enhanced security

**Enhanced Security:**
- **Device Binding:** Bind authentication to specific devices
- **Behavioral Analytics:** Monitor usage patterns for fraud detection
- **Geographic Validation:** Location-based authentication verification
- **Time-based Tokens:** Implement TOTP for additional security layer

**User Experience Improvements:**
- **Smart PIN Entry:** Predictive PIN input based on usage patterns
- **Customizable Interface:** User preference for keypad layout and themes
- **Quick Authentication:** Reduced steps for frequent users
- **Password Manager Integration:** Support for third-party password managers

**Advanced Features:**
- **Adaptive Authentication:** Risk-based authentication requirements
- **Social Recovery:** Account recovery through trusted contacts
- **Enterprise Features:** Support for corporate authentication policies
- **Audit Trail:** Comprehensive logging for security compliance

### Technical Debt Considerations
**Security Architecture:**
- **Key Management:** Implement proper cryptographic key management
- **Secure Storage:** Enhanced secure storage for sensitive data
- **API Security:** Implement certificate pinning and advanced API security
- **Compliance:** Ensure compliance with banking security standards

**Code Quality:**
- **Error Boundaries:** Implement comprehensive error boundary patterns
- **State Management:** Consider more sophisticated state management for complex scenarios
- **Testing Coverage:** Achieve comprehensive test coverage for security-critical code
- **Performance Monitoring:** Implement detailed performance monitoring and alerting

**Maintainability:**
- **Authentication Service:** Abstract authentication logic into reusable service layer
- **Configuration Management:** Externalize security policies and configuration
- **Documentation:** Maintain comprehensive security documentation and procedures
- **Regular Security Audits:** Establish regular security review and penetration testing

**Scalability:**
- **Load Balancing:** Support for distributed authentication services
- **Caching Strategy:** Implement intelligent caching for user profile and session data
- **Monitoring:** Advanced monitoring and alerting for authentication failures and security events
- **Disaster Recovery:** Implement robust backup and recovery procedures for authentication data