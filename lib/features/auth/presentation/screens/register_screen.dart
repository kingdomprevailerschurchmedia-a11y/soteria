import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/services/ui_service.dart';
import '../../application/registration_controller.dart';
import '../../application/registration_state.dart';
import '../providers/auth_providers.dart';
import '../widgets/registration/password_strength_meter.dart';
import '../widgets/registration/requirement_checklist.dart';
import '../widgets/registration/username_availability_card.dart';
import '../widgets/registration/registration_step_indicator.dart';
import '../widgets/registration/registration_review_card.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final PageController _pageController = PageController();
  final _step1FormKey = GlobalKey<FormState>();
  final _step2FormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    final state = ref.read(registrationControllerProvider);
    if (state.currentStep == 0) {
      if (_step1FormKey.currentState?.validate() ?? false) {
        _goToNextPage();
      }
    } else if (state.currentStep == 1) {
      if (_step2FormKey.currentState?.validate() ?? false) {
        if (state.isUsernameAvailable) {
          _goToNextPage();
        } else {
          ref.read(uiServiceProvider).showSnackBar(
            context: context,
            message: 'Please choose an available username.',
            type: SnackBarType.warning,
          );
        }
      }
    }
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: SoteriaAnimations.medium,
      curve: SoteriaAnimations.standard,
    );
  }

  void _onBack() {
    _pageController.previousPage(
      duration: SoteriaAnimations.medium,
      curve: SoteriaAnimations.standard,
    );
  }

  Future<void> _onSubmit() async {
    await ref.read(registrationControllerProvider.notifier).submit();
    final auth = ref.read(authStateProvider);
    if (auth.failure != null && mounted) {
      ref.read(uiServiceProvider).showSnackBar(
        context: context,
        message: auth.failure!.message,
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registrationControllerProvider);

    return SoteriaScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: state.currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: _onBack,
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.pop(),
              ),
        title: RegistrationStepIndicator(
          currentStep: state.currentStep,
          totalSteps: state.totalSteps,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (idx) => ref.read(registrationControllerProvider.notifier).setStep(idx),
              children: [
                _buildStep1(state),
                _buildStep2(state),
                _buildStep3(state),
              ],
            ),
          ),
          _buildFooter(state),
        ],
      ),
    );
  }

  Widget _buildFooter(RegistrationState state) {
    final isLastStep = state.currentStep == state.totalSteps - 1;

    return Padding(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SoteriaButton(
            onPressed: isLastStep ? _onSubmit : _onNext,
            label: isLastStep ? 'CREATE ACCOUNT' : 'CONTINUE',
            isLoading: state.isSubmitting,
            type: isLastStep ? SoteriaButtonType.reward : SoteriaButtonType.primary,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
        ],
      ),
    );
  }

  Widget _buildStep1(RegistrationState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Form(
        key: _step1FormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Secure Your Journey',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s8),
            const Text('Enter your credentials to create an account.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: SoteriaSpacing.s40),
            SoteriaTextField(
              label: 'Email Address',
              hintText: 'name@example.com',
              type: SoteriaTextFieldType.email,
              prefixIcon: const Icon(Icons.email_outlined),
              onChanged: ref.read(registrationControllerProvider.notifier).updateEmail,
              validator: Validators.email,
            ),
            const SizedBox(height: SoteriaSpacing.s24),
            SoteriaTextField(
              label: 'Password',
              hintText: 'Create a strong password',
              type: SoteriaTextFieldType.password,
              prefixIcon: const Icon(Icons.lock_outline),
              onChanged: ref.read(registrationControllerProvider.notifier).updatePassword,
              validator: Validators.password,
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            PasswordStrengthMeter(password: state.password),
            const SizedBox(height: SoteriaSpacing.s16),
            RequirementChecklist(password: state.password),
            const SizedBox(height: SoteriaSpacing.s24),
            SoteriaTextField(
              label: 'Confirm Password',
              hintText: 'Repeat your password',
              type: SoteriaTextFieldType.password,
              prefixIcon: const Icon(Icons.lock_reset),
              onChanged: ref.read(registrationControllerProvider.notifier).updateConfirmPassword,
              validator: (v) => Validators.confirmPassword(v, state.password),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2(RegistrationState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Form(
        key: _step2FormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell Us About You',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s8),
            const Text('These details help personalize your academic profile.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: SoteriaSpacing.s40),
            Row(
              children: [
                Expanded(
                  child: SoteriaTextField(
                    label: 'First Name',
                    hintText: 'First',
                    onChanged: ref.read(registrationControllerProvider.notifier).updateFirstName,
                    validator: (v) => Validators.required(v, 'First name'),
                  ),
                ),
                const SizedBox(width: SoteriaSpacing.s16),
                Expanded(
                  child: SoteriaTextField(
                    label: 'Last Name',
                    hintText: 'Last',
                    onChanged: ref.read(registrationControllerProvider.notifier).updateLastName,
                    validator: (v) => Validators.required(v, 'Last name'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SoteriaSpacing.s24),
            SoteriaTextField(
              label: 'Username',
              hintText: 'ScholarID',
              prefixIcon: const Icon(Icons.alternate_email),
              onChanged: ref.read(registrationControllerProvider.notifier).updateUsername,
              validator: Validators.username,
            ),
            const SizedBox(height: SoteriaSpacing.s12),
            UsernameAvailabilityCard(
              username: state.username,
              isAvailable: state.isUsernameAvailable,
              isChecking: state.isCheckingUsername,
            ),
            const SizedBox(height: SoteriaSpacing.s24),
            SoteriaTextField(
              label: 'Referral Code (Optional)',
              hintText: 'CODE123',
              onChanged: ref.read(registrationControllerProvider.notifier).updateReferralCode,
              validator: Validators.referralCode,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep3(RegistrationState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review Details',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s8),
          const Text('Make sure everything is correct before creating your account.', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: SoteriaSpacing.s40),
          RegistrationReviewCard(
            label: 'Account Identity',
            value: state.email,
            onEdit: () => _pageController.animateToPage(0, duration: SoteriaAnimations.slow, curve: Curves.easeInOut),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          RegistrationReviewCard(
            label: 'Full Name',
            value: '${state.firstName} ${state.lastName}',
            onEdit: () => _pageController.animateToPage(1, duration: SoteriaAnimations.slow, curve: Curves.easeInOut),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          RegistrationReviewCard(
            label: 'Public Username',
            value: '@${state.username}',
            onEdit: () => _pageController.animateToPage(1, duration: SoteriaAnimations.slow, curve: Curves.easeInOut),
          ),
          const SizedBox(height: SoteriaSpacing.s40),
          Text(
            'By creating an account, you agree to Soteria\'s Terms of Service and Privacy Policy.',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
