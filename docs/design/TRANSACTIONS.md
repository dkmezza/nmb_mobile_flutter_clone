# Transactions - Design Documentation

## 1. Overview

### Feature Purpose and Scope
The transactions feature provides users with comprehensive access to their account statements and transaction history. This feature includes both full statement generation with customizable date ranges and mini statement views for quick transaction overviews. It serves as the primary tool for account monitoring and financial record keeping.

### User Personas and Use Cases
**Primary Users:**
- **Account Monitors:** Users who regularly check their transaction history and account activity
- **Financial Planners:** Customers who need detailed statements for budgeting and financial planning
- **Business Users:** Account holders who require statements for accounting and record-keeping purposes
- **Occasional Checkers:** Users who need quick access to recent transaction activity

**Use Cases:**
- **Statement Generation:** Generate full account statements for specific date ranges
- **Recent Activity Review:** Quick view of recent transactions via mini statement
- **Email Delivery:** Receive statements via email for record keeping
- **Transaction Analysis:** Review spending patterns and account activity
- **Documentation:** Obtain statements for loan applications, tax purposes, or business records
- **Account Reconciliation:** Match transactions with personal records

### Business Requirements
- Provide flexible date range selection for statement generation
- Support email delivery of statements to user-specified addresses
- Display transaction details with clear categorization and amounts
- Maintain transaction history with proper chronological ordering
- Support different statement formats (full vs. mini statements)
- Enable quick access to recent transaction activity
- Ensure secure access to sensitive financial information
- Provide clear transaction descriptions and reference numbers

## 2. User Journey

### Entry Points
- **Dashboard Statement Buttons:** Primary access via Full Statement, Mini Statement buttons
- **Account Actions:** Direct navigation from account card actions
- **Bottom Navigation:** Access via Transactions tab in bottom navigation
- **Balance View:** Navigation from balance display screen

### User Flow
```
Dashboard → Statement Button → Statement Screen → [Date Selection/Email Input] → Generate Statement → [Email Delivery/View Results]
    ↑              ↓                   ↓                        ↓
    ←── Navigation ←── Configuration ←── Processing ←── Completion
                          ↓
                    Mini Statement (Direct View)
```

### Navigation Patterns
- **Direct Access:** Mini statement shows immediate results
- **Form-Based:** Full statement requires date range and email configuration
- **Progressive Disclosure:** Show form fields in logical order
- **Email Integration:** Optional email delivery with address validation
- **Back Navigation:** Return to dashboard or previous screen

### Exit Points
- **Back to Dashboard:** Return to main app interface
- **Email Confirmation:** Statement sent to specified email address
- **Transaction Details:** Deep dive into specific transaction information
- **Related Actions:** Navigate to related banking services

## 3. Visual Design

### Layout Structure
**Screen Composition (Vertical):**
- **Header Section (0-15%):** Navigation and page title
- **Configuration Section (15-70%):** Form fields and options
- **Action Section (70-85%):** Primary action button
- **Content Section (Variable):** Transaction list (mini statement)

### Full Statement Screen

#### Header Section
**Design Specifications:**
- **Background:** Blue gradient with dotted pattern
- **Height:** 120dp
- **Back Arrow:** Left arrow (24dp, white)
- **Page Title:** "Full Statement" (20sp, medium weight, white)

#### Configuration Form
**Form Container:**
- **Background:** Light gray (#F5F5F5)
- **Padding:** 20dp all sides
- **Card Layout:** White cards with 12dp corner radius

**Account Field:**
- **Label:** "Account" (14sp, regular, medium gray)
- **Value:** "21210037139" (18sp, medium, dark gray)
- **Background:** White card with subtle border
- **Height:** 64dp

**Date Range Fields:**
- **Start Date:**
  - Label: "Start Date" (14sp, regular, medium gray)
  - Value: "2025-04-28" (16sp, regular, dark gray)
  - Icon: Orange calendar icon (24dp) right-aligned
  - Background: White card
  - Height: 64dp

- **End Date:**
  - Label: "End Date" (14sp, regular, medium gray)
  - Value: "2025-05-27" (16sp, regular, dark gray)
  - Icon: Orange calendar icon (24dp) right-aligned
  - Background: White card
  - Height: 64dp

**Quick Date Selection:**
- **Layout:** Horizontal row of 4 buttons
- **Button Size:** Flexible width, 40dp height
- **Background:** White with light gray border
- **Text:** 14sp, medium weight, dark gray
- **Corner Radius:** 20dp
- **Options:** "1 Month", "3 Months", "6 Months", "12 Months"
- **Active State:** Blue background with white text

**Email Input:**
- **Placeholder:** "Enter Email Address" (14sp, regular, light gray)
- **Background:** White card
- **Border:** 1dp light gray, blue when focused
- **Height:** 56dp
- **Corner Radius:** 8dp
- **Validation:** Real-time email format validation

**Proceed Button:**
- **Text:** "PROCEED" (16sp, bold, white)
- **Background:** Blue (#1E4A8C)
- **Width:** Full width minus 40dp margins
- **Height:** 56dp
- **Corner Radius:** 28dp
- **States:** Normal, pressed, loading, disabled

### Mini Statement Screen

#### Header Section
**Design Specifications:**
- **Background:** Blue gradient with dotted pattern
- **Height:** 120dp
- **Back Arrow:** Left arrow (24dp, white)
- **Page Title:** "Mini Statement" (20sp, medium weight, white)

#### Transaction List
**List Container:**
- **Background:** Light gray (#F5F5F5)
- **Padding:** 16dp horizontal, 8dp vertical

**Transaction Card Specifications:**
- **Background:** White
- **Corner Radius:** 12dp
- **Elevation:** 2dp shadow
- **Padding:** 16dp
- **Margin:** 8dp vertical between cards

**Transaction Item Layout:**
- **Icon Section (Left):**
  - Size: 48dp circular container
  - Background: Orange (#FF6B35) or Blue (#1E4A8C)
  - Icon: 24dp white icon (arrow up/down based on transaction type)

- **Content Section (Center):**
  - **Transaction Title:** 16sp, medium weight, dark gray
  - **Reference Number:** 12sp, regular, medium gray
  - **Date:** 12sp, regular, medium gray
  - **Line Height:** 1.2x spacing between elements

- **Amount Section (Right):**
  - **Amount:** 18sp, bold, dark gray
  - **Currency:** "TZS" prefix
  - **Alignment:** Right-aligned
  - **Color:** Green for credits, red for debits

**Transaction Types:**
1. **Microlending Loan Instalment Payment:**
   - Icon: Orange background with upward arrow
   - Reference: Transaction-specific code
   - Examples: TZS 15,468; TZS 165,000

2. **TIPS Payments:**
   - Icon: Blue background with downward arrow
   - Reference: Transaction-specific code
   - Examples: TZS 18,000; TZS 170,000

3. **VAT Payable on Comm and Fees:**
   - Icon: Orange background with upward arrow
   - Reference: Transaction-specific code
   - Examples: TZS 274.58; TZS 838.98

4. **Monthly fee for Savings and Current Accounts:**
   - Icon: Orange background with upward arrow
   - Reference: Transaction-specific code
   - Example: TZS 1,525.42

5. **Funds Transfer Charge:**
   - Icon: Orange background with upward arrow
   - Reference: Transaction-specific code
   - Example: TZS 4,661.02

6. **Funds Transfer:**
   - Icon: Orange background with upward arrow
   - Reference: Transaction-specific code
   - Example: TZS 90,000

### Responsive Design Considerations
**Small Screens (<360dp width):**
- Stack date range fields vertically
- Reduce transaction card padding
- Adjust font sizes proportionally
- Maintain minimum touch targets

**Large Screens (>400dp width):**
- Maintain form layout as designed
- Increase spacing for better visual hierarchy
- Consider larger transaction cards for better readability

**Landscape Orientation:**
- Compress header height
- Maintain form functionality
- Ensure scrollable content for transaction lists

## 4. Technical Implementation

### State Management Approach
```dart
// Riverpod Providers
final transactionsStateProvider = StateNotifierProvider<TransactionsNotifier, TransactionsState>(
  (ref) => TransactionsNotifier(ref.read(transactionsRepositoryProvider)),
);

final statementDateRangeProvider = StateProvider<DateRange?>((ref) => null);

final statementEmailProvider = StateProvider<String>((ref) => '');

final quickDateSelectionProvider = StateProvider<int?>((ref) => null);

final miniStatementProvider = FutureProvider<List<Transaction>>((ref) async {
  return ref.read(transactionsRepositoryProvider).getMiniStatement();
});
```

### State Classes
```dart
// Transaction States
abstract class TransactionsState {}
class TransactionsInitial extends TransactionsState {}
class TransactionsLoading extends TransactionsState {}
class TransactionsLoaded extends TransactionsState {
  final List<Transaction> transactions;
  TransactionsLoaded(this.transactions);
}
class StatementGenerating extends TransactionsState {}
class StatementGenerated extends TransactionsState {
  final StatementResult result;
  StatementGenerated(this.result);
}
class TransactionsError extends TransactionsState {
  final String message;
  TransactionsError(this.message);
}

// Transactions Notifier
class TransactionsNotifier extends StateNotifier<TransactionsState> {
  final TransactionsRepository _transactionsRepository;
  
  TransactionsNotifier(this._transactionsRepository) : super(TransactionsInitial());
  
  Future<void> loadMiniStatement() async {
    state = TransactionsLoading();
    try {
      final transactions = await _transactionsRepository.getMiniStatement();
      state = TransactionsLoaded(transactions);
    } catch (e) {
      state = TransactionsError(e.toString());
    }
  }
  
  Future<void> generateFullStatement({
    required DateRange dateRange,
    required String email,
  }) async {
    state = StatementGenerating();
    try {
      final result = await _transactionsRepository.generateStatement(
        startDate: dateRange.start,
        endDate: dateRange.end,
        email: email,
      );
      state = StatementGenerated(result);
    } catch (e) {
      state = TransactionsError(e.toString());
    }
  }
  
  void setQuickDateRange(int months) {
    final endDate = DateTime.now();
    final startDate = DateTime(endDate.year, endDate.month - months, endDate.day);
    // Update date range provider
  }
}
```

### Data Models
```dart
class Transaction {
  final String id;
  final String title;
  final String referenceNumber;
  final double amount;
  final String currency;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;
  final TransactionDirection direction;
  
  const Transaction({
    required this.id,
    required this.title,
    required this.referenceNumber,
    required this.amount,
    required this.currency,
    required this.date,
    required this.type,
    required this.category,
    required this.direction,
  });
}

enum TransactionType {
  loanPayment,
  tipsPayment,
  vatPayment,
  monthlyFee,
  fundsTransfer,
  transferCharge,
  other,
}

enum TransactionCategory {
  loan,
  payment,
  fee,
  transfer,
  tax,
  other,
}

enum TransactionDirection { debit, credit }

class DateRange {
  final DateTime start;
  final DateTime end;
  
  const DateRange({
    required this.start,
    required this.end,
  });
  
  Duration get duration => end.difference(start);
  
  bool get isValid => start.isBefore(end);
}

class StatementRequest {
  final String accountNumber;
  final DateTime startDate;
  final DateTime endDate;
  final String email;
  final StatementFormat format;
  
  const StatementRequest({
    required this.accountNumber,
    required this.startDate,
    required this.endDate,
    required this.email,
    required this.format,
  });
}

enum StatementFormat { pdf, excel, csv }

class StatementResult {
  final String statementId;
  final bool emailSent;
  final String? downloadUrl;
  final DateTime generatedAt;
  final StatementMetadata metadata;
  
  const StatementResult({
    required this.statementId,
    required this.emailSent,
    this.downloadUrl,
    required this.generatedAt,
    required this.metadata,
  });
}

class StatementMetadata {
  final int transactionCount;
  final double totalDebits;
  final double totalCredits;
  final double netAmount;
  final DateRange dateRange;
  
  const StatementMetadata({
    required this.transactionCount,
    required this.totalDebits,
    required this.totalCredits,
    required this.netAmount,
    required this.dateRange,
  });
}
```

### API Requirements
**Transaction Retrieval:**
- GET `/api/v1/transactions/mini-statement` - Get recent transactions for mini statement
- GET `/api/v1/transactions` - Get transactions with date range and pagination
- GET `/api/v1/transactions/{transactionId}` - Get specific transaction details

**Statement Generation:**
- POST `/api/v1/statements/generate` - Generate full statement with parameters
- GET `/api/v1/statements/{statementId}` - Get generated statement details
- GET `/api/v1/statements/download/{statementId}` - Download statement file

**Account Information:**
- GET `/api/v1/accounts/{accountId}/balance` - Get current account balance
- GET `/api/v1/accounts/{accountId}/summary` - Get account summary information

### Error Handling
**Network Errors:**
- **Connection Issues:** Show cached transactions with refresh option
- **Timeout:** Retry mechanism with user feedback
- **Server Errors:** Clear error messaging with retry options

**Validation Errors:**
- **Invalid Date Range:** Real-time validation with helpful error messages
- **Email Format:** Immediate feedback on email format validation
- **Future Dates:** Prevent selection of future dates for statements

**Business Logic Errors:**
- **No Transactions:** Clear messaging when no transactions exist for date range
- **Statement Generation Failed:** Retry options with alternative email delivery
- **Account Access:** Handle account permission and access issues

## 5. Interactions & Animations

### Micro-interactions
**Date Picker Interactions:**
- **Calendar Icon Tap:** Scale animation and date picker modal presentation
- **Date Selection:** Smooth transition between selected dates
- **Quick Date Buttons:** Immediate visual feedback and date range update

**Form Interactions:**
- **Input Focus:** Smooth border color transition to blue
- **Email Validation:** Real-time validation with color-coded feedback
- **Button States:** Loading spinner animation during statement generation

**Transaction List:**
- **Card Tap:** Scale animation and potential detail view navigation
- **Pull to Refresh:** Standard refresh animation for updated transactions
- **Loading States:** Skeleton cards during initial load

### Transitions
**Screen Navigation:**
- **Statement Screens:** Slide in from right (300ms)
- **Modal Presentations:** Date picker and email confirmation modals
- **Success States:** Smooth transition to confirmation or results screen

**Form Progression:**
- **Field Completion:** Progressive form revelation as fields are completed
- **Validation Feedback:** Immediate visual feedback for form validation
- **Submit Success:** Brief success animation before proceeding

**List Loading:**
- **Progressive Loading:** Transactions load in batches with smooth animations
- **Content Updates:** Smooth insertion of new transactions
- **Error States:** Clear error indication with retry mechanisms

### Loading States
**Mini Statement Loading:**
- **Skeleton Cards:** Show transaction card structure during loading
- **Progressive Load:** Load transactions in chronological order
- **Smooth Transition:** Fade from skeleton to actual content

**Statement Generation:**
- **Button Loading:** "PROCEED" button shows loading spinner
- **Progress Indication:** Clear feedback during statement processing
- **Email Confirmation:** Visual confirmation when email is sent

### Feedback Mechanisms
**Haptic Feedback:**
- **Date Selection:** Light impact when selecting dates
- **Button Presses:** Light impact for all interactive elements
- **Success Actions:** Success haptic pattern for completed operations

**Visual Feedback:**
- **Form Validation:** Color-coded validation (green for valid, red for invalid)
- **Loading Progress:** Clear progress indicators during operations
- **Success States:** Green checkmarks and confirmation messaging

**Audio Feedback (Optional):**
- **Success Sounds:** Subtle confirmation sounds for completed actions
- **Error Sounds:** Gentle error tones for validation failures

## 6. Accessibility & Performance

### Accessibility Requirements
**Screen Reader Support:**
- **Transaction Details:** Clear reading of transaction type, amount, and date
- **Form Labels:** Proper labeling of all input fields and buttons
- **Date Information:** Accessible date format and range information
- **Status Updates:** Announce loading states and completion status

**Motor Accessibility:**
- **Touch Targets:** All interactive elements minimum 44dp
- **Date Picker:** Accessible date selection interface
- **Form Navigation:** Logical tab order through form fields
- **Alternative Input:** Support for external keyboards and voice input

**Visual Accessibility:**
- **High Contrast:** Support system high contrast mode
- **Text Scaling:** Support up to 200% text scaling
- **Color Independence:** Transaction types not identified by color alone
- **Focus Indicators:** Clear focus indicators for keyboard navigation

**Cognitive Accessibility:**
- **Clear Labeling:** Descriptive labels for all transaction types
- **Date Formatting:** Consistent, readable date formats
- **Error Messages:** Clear, actionable error messaging
- **Progress Indication:** Clear progress through statement generation process

### Performance Considerations
**Load Time Optimization:**
- **Transaction Caching:** Cache recent transactions for quick mini statement access
- **Pagination:** Load transactions in batches for large date ranges
- **Background Sync:** Sync recent transactions in background

**Memory Management:**
- **List Recycling:** Efficient recycling of transaction list items
- **Image Optimization:** Optimized icons and graphics
- **State Cleanup:** Proper cleanup when leaving transaction screens

**Network Efficiency:**
- **Compressed Responses:** Minimize API response sizes
- **Incremental Loading:** Load additional transactions as needed
- **Offline Support:** Cache transactions for offline viewing

### Testing Requirements
**Unit Tests:**
- **State Management:** Test all transaction state transitions
- **Date Logic:** Test date range validation and quick date selection
- **Data Models:** Test transaction parsing and formatting
- **Business Logic:** Test statement generation logic

**Widget Tests:**
- **Form Rendering:** Test statement form rendering and validation
- **Transaction List:** Test transaction list rendering and interactions
- **Date Picker:** Test date selection functionality
- **Email Validation:** Test email input validation

**Integration Tests:**
- **Full Statement Flow:** End-to-end statement generation
- **Mini Statement:** Complete mini statement loading and display
- **API Integration:** Test transaction API calls and error handling
- **Email Delivery:** Test statement email delivery functionality

**Performance Tests:**
- **List Performance:** Test performance with large transaction lists
- **Memory Usage:** Monitor memory consumption during extended use
- **Network Efficiency:** Test with slow and unreliable connections

## 7. Future Enhancements

### Planned Improvements
**Advanced Filtering:**
- **Transaction Categories:** Filter by transaction type or category
- **Amount Ranges:** Filter transactions by amount thresholds
- **Search Functionality:** Search transactions by description or reference
- **Smart Filtering:** AI-powered transaction categorization and insights

**Enhanced Statements:**
- **Multiple Formats:** PDF, Excel, CSV statement formats
- **Custom Templates:** Personalized statement templates and branding
- **Scheduled Statements:** Automatic periodic statement generation
- **Statement Analytics:** Visual spending analysis and trends

**Improved User Experience:**
- **Transaction Details:** Detailed view for individual transactions
- **Receipt Integration:** Link transactions to digital receipts
- **Dispute Management:** Initiate transaction disputes directly from statements
- **Export Options:** Export transaction data in various formats

**Smart Features:**
- **Spending Insights:** AI-powered spending analysis and recommendations
- **Budget Integration:** Connect transactions to budgeting features
- **Predictive Analytics:** Forecast future spending based on transaction history
- **Automated Categorization:** Smart transaction categorization

### Technical Debt Considerations
**Performance Optimization:**
- **Database Indexing:** Optimize transaction queries for better performance
- **Caching Strategy:** Implement more sophisticated caching for frequently accessed data
- **Background Processing:** Move heavy operations to background tasks
- **Memory Optimization:** Optimize memory usage for large transaction datasets

**User Experience:**
- **Offline Capabilities:** Enhanced offline transaction viewing and statement generation
- **Real-time Updates:** Live transaction notifications and updates
- **Advanced Search:** Full-text search across transaction descriptions
- **Accessibility Enhancements:** Enhanced accessibility features and testing

**Maintainability:**
- **API Versioning:** Proper versioning for transaction and statement APIs
- **Error Handling:** More comprehensive error handling and recovery
- **Testing Framework:** Enhanced automated testing for transaction functionality
- **Documentation:** Comprehensive API and feature documentation

**Scalability:**
- **Data Archiving:** Efficient archiving of old transaction data
- **Performance Monitoring:** Detailed monitoring of transaction loading performance
- **Load Balancing:** Distribute transaction processing across multiple servers
- **Cloud Integration:** Enhanced cloud-based statement generation and storage