# Dashboard - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The dashboard serves as the central hub of the NMB Mobile app, providing users with immediate access to their account information, quick banking services, and navigation to all app features. This feature acts as the primary interface after successful authentication, offering both account overview and service discovery in a clean, organized layout.

### User Personas and Use Cases
**Primary Users:**
- **Active Banking Customers:** Users who frequently check balances and perform transactions
- **Service-Oriented Users:** Customers who primarily use specific banking services (payments, transfers, etc.)
- **Information Seekers:** Users who mainly check account information and statements
- **Multi-Account Holders:** Customers managing multiple accounts and services

**Use Cases:**
- **Quick Balance Check:** Immediate account balance visibility without additional navigation
- **Service Access:** One-tap access to frequently used banking services
- **Account Management:** Overview and management of multiple accounts
- **Transaction Initiation:** Starting point for various banking transactions
- **Service Discovery:** Exploring available banking products and services
- **Account Navigation:** Hub for accessing statements, cards, and account details

### Business Requirements
- Provide immediate account balance and information visibility
- Offer quick access to all major banking services
- Support multiple account types and management
- Enable efficient service discovery and usage
- Maintain clear visual hierarchy and information organization
- Support both primary and secondary banking functions
- Facilitate cross-selling through service visibility
- Ensure secure information display with appropriate privacy controls

## 2. User Journey

### Entry Points
- **Successful Authentication:** Primary entry after PIN authentication
- **App Resume:** Return to dashboard from other app sections
- **Deep Links:** Direct navigation to dashboard from notifications or external links
- **Tab Navigation:** Return via bottom navigation from other main sections

### User Flow
```
Authentication Success → Dashboard → [Service Selection] → Service Flow
         ↑                ↓              ↓
         ←── Tab Navigation ←── Bottom Navigation
                            ↓
                      QR Scanner (FAB)
```

### Navigation Patterns
- **Tab-Based Navigation:** Bottom navigation bar with 5 primary sections
- **Service Grid:** 3x3 grid layout for quick service access
- **Account Switching:** Header-based account selection and management
- **Deep Navigation:** Each service leads to dedicated feature flows
- **Quick Actions:** Immediate access to high-frequency operations

### Exit Points
- **Service Navigation:** Transition to specific banking services
- **Tab Navigation:** Move to Transactions, Cards, or Favourites sections
- **QR Scanner:** Launch camera-based QR scanning functionality
- **Account Management:** Access to account settings and profile
- **Statement Access:** Navigation to detailed account statements

## 3. Visual Design

### Layout Structure
**Screen Composition (Vertical):**
- **Header Section (0-25%):** User profile, account info, and settings
- **Account Card (25-40%):** Primary account display with balance actions
- **Service Grid (40-85%):** 3x3 grid of banking services
- **Bottom Navigation (85-100%):** Primary app navigation with floating action button

### Header Section
**Design Specifications:**
- **Background:** Blue gradient with dotted pattern overlay
- **Height:** Approximately 200dp
- **User Profile Circle:**
  - Size: 48dp diameter
  - Background: Semi-transparent white
  - Text: User initials (DM for David Mezza)
  - Typography: 18sp, bold, blue text
  - Position: Top left, 16dp margins

**User Greeting:**
- **Primary Text:** "Hi," (16sp, white, regular weight)
- **Secondary Text:** "David Mezza" (20sp, white, medium weight)
- **Position:** Adjacent to profile circle, left-aligned

**Settings Icon:**
- **Icon:** Gear/settings icon (24dp)
- **Color:** White
- **Position:** Top right, 16dp margin
- **Function:** Access to app settings and preferences

**Account Section Toggle:**
- **Left Side:** "MY ACCOUNT" (active state)
- **Right Side:** "OTHER ACCOUNTS" with grid icon
- **Typography:** 14sp, medium weight, white
- **Indicator:** Underline for active section

### Account Card
**Card Specifications:**
- **Background:** White with subtle shadow
- **Corner Radius:** 12dp
- **Margins:** 20dp horizontal, positioned to overlap header
- **Elevation:** 4dp shadow for depth
- **Padding:** 20dp all around

**Account Information:**
- **Account Number:** "21210037139" (24sp, bold, dark blue #1E4A8C)
- **Account Type:** "Personal account" (14sp, regular, medium gray #757575)
- **Bank Logo:** NMB logo positioned top right of card
- **Background Pattern:** Subtle geometric pattern in light gray

**Action Buttons Row:**
- **Layout:** 3 equally spaced circular buttons
- **Button Size:** 56dp diameter
- **Background:** Light blue background (#E3F2FD)
- **Icon Size:** 24dp, blue icons

**Button Specifications:**
1. **Full Statement:**
   - Icon: Document/list icon
   - Label: "Full Statement" (12sp, center-aligned below button)

2. **Mini Statement:**
   - Icon: Receipt/short document icon
   - Label: "Mini Statement" (12sp, center-aligned below button)

3. **Show Balance:**
   - Icon: Eye/visibility icon
   - Label: "Show Balance" (12sp, center-aligned below button)

### Service Grid
**Grid Layout:**
- **Configuration:** 3x3 grid (9 total services)
- **Container:** Light gray background (#F5F5F5)
- **Padding:** 20dp all sides
- **Item Spacing:** 16dp between grid items

**Service Card Specifications:**
- **Size:** Square cards, flexible width based on screen size
- **Background:** White (#FFFFFF)
- **Corner Radius:** 12dp
- **Elevation:** 2dp shadow
- **Padding:** 16dp top, 12dp sides and bottom
- **Aspect Ratio:** 1:1 (square)

**Service Card Content:**
- **Icon:** 32dp service-specific icon, centered
- **Label:** Service name (14sp, medium weight, center-aligned)
- **Icon Colors:** Blue and orange themed to match brand colors

**Service Grid Items:**
1. **Send Money:**
   - Icon: Envelope with arrow (blue and orange)
   - Function: Money transfer services

2. **Bill Payment:**
   - Icon: Bill/receipt with checkmark (blue)
   - Function: Utility and service bill payments

3. **Withdraw:**
   - Icon: ATM/cash withdrawal (blue and orange)
   - Function: Cash withdrawal services

4. **Lipa Mkononi:**
   - Icon: QR code scanner (blue and orange)
   - Function: Mobile payment services

5. **Salary Advance:**
   - Icon: Money bag with clock (blue)
   - Function: Advance salary services

6. **Mshiko Fasta:**
   - Icon: Money/cash notes (blue and orange)
   - Function: Fast loan services

7. **Jiwekee:**
   - Icon: Savings bag (blue)
   - Function: Savings services

8. **Spend To Save:**
   - Icon: Wallet with arrow (blue and orange)
   - Function: Spending-based savings

9. **More:**
   - Icon: Three dots in circle (blue)
   - Function: Additional services menu

### Bottom Navigation
**Navigation Bar Specifications:**
- **Height:** 80dp
- **Background:** White with top border
- **Elevation:** 8dp shadow above
- **Tab Configuration:** 5 tabs with center floating action button

**Tab Specifications:**
- **Width:** Equal distribution across screen width
- **Active State:** Orange underline (4dp thick) and orange icon
- **Inactive State:** Gray icons with no underline
- **Icon Size:** 24dp
- **Label Typography:** 12sp, medium weight

**Navigation Tabs:**
1. **Home:** House icon (active state - orange)
2. **Transactions:** List/document icon
3. **QR Scanner:** Central floating action button
4. **Cards:** Credit card icon
5. **Favourites:** Star icon

**Floating Action Button (QR Scanner):**
- **Size:** 56dp diameter
- **Background:** Orange gradient (#FF6B35)
- **Elevation:** 6dp
- **Icon:** QR code scanner (white, 24dp)
- **Position:** Center of bottom navigation, elevated above bar

### Responsive Design Considerations
**Small Screens (<360dp width):**
- Reduce service grid card size proportionally
- Maintain minimum 44dp touch targets
- Adjust header height to preserve content visibility
- Stack account actions vertically if needed

**Large Screens (>400dp width):**
- Maintain service grid as 3x3 layout
- Increase padding and margins proportionally
- Consider larger account card for better information display
- Maintain bottom navigation proportions

**Landscape Orientation:**
- Compress header height
- Maintain service grid layout but adjust spacing
- Ensure bottom navigation remains accessible
- Consider horizontal scrolling for service grid if needed

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final dashboardStateProvider = StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(ref.read(accountRepositoryProvider)),
);

final accountBalanceProvider = FutureProvider.family<AccountBalance, String>((ref, accountId) async {
  return ref.read(accountRepositoryProvider).getAccountBalance(accountId);
});

final activeAccountProvider = StateProvider<Account?>((ref) => null);

final servicesProvider = FutureProvider<List<BankingService>>((ref) async {
  return ref.read(servicesRepositoryProvider).getAvailableServices();
});

final bottomNavigationProvider = StateProvider<int>((ref) => 0);
```

### State Classes
```dart
// Dashboard States
abstract class DashboardState {}
class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  final List<Account> accounts;
  final Account activeAccount;
  final List<BankingService> services;
  DashboardLoaded(this.accounts, this.activeAccount, this.services);
}
class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

// Dashboard Notifier
class DashboardNotifier extends StateNotifier<DashboardState> {
  final AccountRepository _accountRepository;
  
  DashboardNotifier(this._accountRepository) : super(DashboardInitial()) {
    loadDashboard();
  }
  
  Future<void> loadDashboard() async {
    state = DashboardLoading();
    try {
      final accounts = await _accountRepository.getUserAccounts();
      final activeAccount = accounts.first; // or get from preferences
      final services = await _servicesRepository.getAvailableServices();
      state = DashboardLoaded(accounts, activeAccount, services);
    } catch (e) {
      state = DashboardError(e.toString());
    }
  }
  
  void switchAccount(Account account) async {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      state = DashboardLoaded(currentState.accounts, account, currentState.services);
    }
  }
  
  Future<void> refreshDashboard() async {
    await loadDashboard();
  }
}
```

### Data Models
```dart
class Account {
  final String accountId;
  final String accountNumber;
  final String accountType;
  final String accountName;
  final bool isPrimary;
  final AccountBalance? balance;
  final String currency;
  
  const Account({
    required this.accountId,
    required this.accountNumber,
    required this.accountType,
    required this.accountName,
    required this.isPrimary,
    this.balance,
    required this.currency,
  });
}

class AccountBalance {
  final double availableBalance;
  final double currentBalance;
  final double pendingTransactions;
  final DateTime lastUpdated;
  final bool isVisible;
  
  const AccountBalance({
    required this.availableBalance,
    required this.currentBalance,
    required this.pendingTransactions,
    required this.lastUpdated,
    required this.isVisible,
  });
}

class BankingService {
  final String serviceId;
  final String serviceName;
  final String iconPath;
  final String route;
  final bool isEnabled;
  final bool isPremium;
  final ServiceCategory category;
  
  const BankingService({
    required this.serviceId,
    required this.serviceName,
    required this.iconPath,
    required this.route,
    required this.isEnabled,
    required this.isPremium,
    required this.category,
  });
}

enum ServiceCategory {
  transfer,
  payment,
  loan,
  savings,
  utility,
  other,
}

class UserProfile {
  final String userId;
  final String firstName;
  final String lastName;
  final String initials;
  final String phoneNumber;
  final String email;
  final String profileImageUrl;
  
  const UserProfile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.initials,
    required this.phoneNumber,
    required this.email,
    required this.profileImageUrl,
  });
}
```

### API Requirements
**Account Management:**
- GET `/api/v1/accounts` - Get user accounts list
- GET `/api/v1/accounts/{accountId}/balance` - Get specific account balance
- GET `/api/v1/accounts/{accountId}/summary` - Get account summary information
- PUT `/api/v1/accounts/{accountId}/primary` - Set primary account

**Services:**
- GET `/api/v1/services` - Get available banking services
- GET `/api/v1/services/featured` - Get featured/promoted services
- POST `/api/v1/services/{serviceId}/access` - Log service access for analytics

**User Profile:**
- GET `/api/v1/user/profile` - Get user profile information
- GET `/api/v1/user/preferences` - Get user dashboard preferences
- PUT `/api/v1/user/preferences` - Update dashboard preferences

**Dashboard Analytics:**
- POST `/api/v1/analytics/dashboard/view` - Track dashboard views
- POST `/api/v1/analytics/service/click` - Track service usage
- POST `/api/v1/analytics/account/switch` - Track account switching

### Error Handling
**Network Errors:**
- **Connection Issues:** Show cached data with refresh option
- **Timeout:** Retry mechanism with exponential backoff
- **API Errors:** Graceful degradation with partial functionality

**Data Loading Errors:**
- **Account Balance Failed:** Show account info without balance, retry option
- **Services Loading Failed:** Show cached services or essential services only
- **Profile Loading Failed:** Show generic profile with user initials

**Security Errors:**
- **Session Expired:** Automatic redirect to authentication
- **Unauthorized Access:** Clear user data and redirect to login
- **Permission Denied:** Show appropriate message and alternative actions

## 5. Interactions & Animations

### Micro-interactions
**Service Card Interactions:**
- **Tap Animation:** Scale down to 0.95x for 100ms, then back to 1.0x
- **Hover State:** Slight elevation increase (4dp shadow)
- **Loading State:** Subtle shimmer animation while services load

**Account Card Interactions:**
- **Balance Toggle:** Smooth fade between hidden (****) and visible balance
- **Statement Buttons:** Brief scale animation and color change on press
- **Account Switch:** Slide animation when switching between accounts

**Bottom Navigation:**
- **Tab Selection:** Smooth color transition and underline animation
- **FAB Press:** Scale animation with ripple effect
- **Badge Notifications:** Subtle bounce animation for notification badges

### Transitions
**Dashboard Load:**
- **Staggered Animation:** Header loads first, then account card, then service grid
- **Timing:** 150ms delay between each section
- **Easing:** Ease-out curve for natural feel

**Service Navigation:**
- **Card to Screen:** Hero animation from service card to service screen
- **Duration:** 300ms transition
- **Return Animation:** Reverse hero animation when returning to dashboard

**Account Switch:**
- **Card Flip:** 3D flip animation when switching accounts
- **Duration:** 400ms
- **Balance Update:** Fade out old balance, fade in new balance

### Loading States
**Initial Dashboard Load:**
- **Skeleton Screen:** Show layout structure with loading placeholders
- **Progressive Loading:** Load account info first, then services
- **Content Replacement:** Smooth transition from skeleton to real content

**Balance Refresh:**
- **Pull-to-Refresh:** Standard pull gesture with refresh indicator
- **Auto-Refresh:** Background refresh every 5 minutes when app is active
- **Loading Indicator:** Small spinner in account card during balance update

**Service Loading:**
- **Shimmer Effect:** Animated placeholder cards while services load
- **Graceful Fallback:** Show essential services if full list fails to load

### Feedback Mechanisms
**Haptic Feedback:**
- **Service Selection:** Light impact feedback
- **Account Switch:** Medium impact feedback
- **FAB Press:** Success haptic pattern

**Visual Feedback:**
- **Service Access:** Brief highlight animation on selected service
- **Balance Visibility:** Smooth transition with eye icon animation
- **Refresh Success:** Brief green checkmark animation

**Error Feedback:**
- **Connection Issues:** Toast notification with retry option
- **Service Unavailable:** Gray out service card with "Unavailable" overlay
- **Balance Load Failed:** Show placeholder with refresh button

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Service Cards:** Clear labels describing each banking service function
- **Account Information:** Proper labeling of account numbers and balances
- **Navigation:** Semantic labels for all navigation elements
- **Balance Privacy:** Announce when balance visibility is toggled

**Motor Accessibility:**
- **Touch Targets:** All interactive elements minimum 44dp
- **Service Grid:** Adequate spacing to prevent accidental selection
- **Swipe Gestures:** Support for alternative navigation methods
- **Voice Control:** Support for voice-activated service selection

**Visual Accessibility:**
- **High Contrast:** Support system high contrast mode
- **Text Scaling:** Support up to 200% text scaling
- **Color Coding:** Don't rely solely on color for information
- **Focus Indicators:** Clear focus indicators for external navigation

**Cognitive Accessibility:**
- **Clear Labeling:** Descriptive labels for all services
- **Consistent Layout:** Maintain consistent service positioning
- **Simple Navigation:** Logical flow and clear hierarchy
- **Error Recovery:** Clear instructions for resolving issues

### Performance Considerations
**Load Time Optimization:**
- **Critical Path:** Prioritize account balance and core services
- **Lazy Loading:** Load service icons and non-critical data progressively
- **Caching:** Cache account data and service configurations
- **Prefetching:** Preload likely next screens based on user behavior

**Memory Management:**
- **Image Optimization:** Efficient service icon loading and caching
- **State Management:** Proper cleanup of unused providers
- **List Recycling:** Efficient rendering of account and service lists

**Network Efficiency:**
- **Data Bundling:** Combine multiple API calls where possible
- **Incremental Updates:** Only fetch changed data on refresh
- **Offline Support:** Cache essential data for offline viewing
- **Compression:** Optimize API response sizes

### Testing Requirements
**Unit Tests:**
- **State Management:** Test all dashboard state transitions
- **Data Models:** Test account and service data handling
- **Business Logic:** Test balance calculations and service filtering
- **Error Scenarios:** Test error handling and recovery

**Widget Tests:**
- **Dashboard Rendering:** Test dashboard layout at various screen sizes
- **Service Grid:** Test service card rendering and interactions
- **Account Card:** Test account information display and actions
- **Navigation:** Test bottom navigation and tab switching

**Integration Tests:**
- **Full Dashboard Flow:** End-to-end dashboard loading and interaction
- **Service Navigation:** Test navigation to and from services
- **Account Switching:** Test multi-account functionality
- **Refresh Functionality:** Test pull-to-refresh and auto-refresh

**Performance Tests:**
- **Load Time:** Measure dashboard load time under various conditions
- **Memory Usage:** Monitor memory consumption during extended use
- **Network Efficiency:** Test with slow and unreliable connections
- **Animation Performance:** Ensure smooth animations on lower-end devices

## 7. Future Enhancements

### Planned Improvements
**Personalization:**
- **Custom Service Grid:** Allow users to reorder and customize service shortcuts
- **Personalized Insights:** Show spending insights and financial health metrics
- **Smart Recommendations:** Suggest services based on usage patterns and financial data
- **Dashboard Themes:** Multiple visual themes and layout options

**Enhanced Features:**
- **Widget Integration:** Home screen widgets for quick balance checking
- **Biometric Balance:** Fingerprint/Face ID protected balance visibility
- **Multi-Currency Support:** Display multiple currency accounts
- **Real-time Notifications:** Live transaction notifications and alerts

**Advanced Analytics:**
- **Spending Categories:** Visual breakdown of spending by category
- **Financial Goals:** Track savings goals and financial milestones
- **Usage Analytics:** Personal banking usage insights and trends
- **Predictive Features:** Predict cash flow and suggest financial actions

**Social Features:**
- **Family Accounts:** Shared family account management and oversight
- **Social Payments:** Easy money sharing with contacts
- **Group Savings:** Collaborative savings goals and challenges
- **Referral Program:** Built-in referral tracking and rewards

### Technical Debt Considerations
**Architecture Improvements:**
- **Modular Services:** Break down dashboard into smaller, reusable components
- **State Optimization:** Implement more sophisticated state management for complex scenarios
- **API Optimization:** Consolidate API calls and improve data fetching efficiency
- **Performance Monitoring:** Implement comprehensive performance tracking

**Security Enhancements:**
- **Enhanced Privacy:** More granular privacy controls for balance and account information
- **Session Management:** Improved session handling and security policies
- **Fraud Detection:** Real-time fraud detection and prevention measures
- **Audit Logging:** Comprehensive audit trail for all dashboard activities

**Maintainability:**
- **Component Library:** Develop reusable component library for consistent UI
- **Documentation:** Maintain comprehensive component and API documentation
- **Testing Framework:** Implement automated testing for all dashboard functionality
- **Accessibility Audits:** Regular accessibility compliance checking and improvement

**Scalability:**
- **Performance Optimization:** Optimize for handling large numbers of accounts and services
- **Feature Flags:** Dynamic feature enablement and A/B testing infrastructure
- **Cloud Integration:** Enhanced cloud-based features and synchronization
- **Multi-platform Support:** Ensure consistent experience across mobile and web platforms