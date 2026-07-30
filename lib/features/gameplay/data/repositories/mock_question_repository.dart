import '../../domain/entities/question.dart';
import '../../domain/entities/question_option.dart';
import '../../domain/entities/question_type.dart';
import '../../domain/entities/question_difficulty.dart';
import '../../domain/repositories/question_repository.dart';

class MockQuestionRepository implements QuestionRepository {
  @override
  Future<List<Question>> getQuestions({
    int? limit,
    List<String>? categories,
    QuestionDifficulty? difficulty,
    List<QuestionType>? types,
    String? subjectId,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final questions = _mockData.where((q) {
      if (difficulty != null && q.difficulty != difficulty) return false;
      if (types != null && !types.contains(q.type)) return false;
      if (subjectId != null && q.subjectId != subjectId) return false;
      if (categories != null && categories.isNotEmpty) {
        if (!q.categories.any((cat) => categories.contains(cat))) return false;
      }
      return true;
    }).toList();

    if (limit != null) {
      return questions.take(limit).toList();
    }
    return questions;
  }

  @override
  Future<Question?> getQuestionById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _mockData.firstWhere((q) => q.id == id);
  }

  final List<Question> _mockData = [
    Question(
      id: '1',
      text: 'What is the primary mission of the Soteria protocol?',
      type: QuestionType.multipleChoice,
      difficulty: QuestionDifficulty.beginner,
      categories: ['Governance', 'Security'],
      subjectId: 'blockchain_basics',
      options: [
        const QuestionOption(id: '1a', text: 'Decentralized Identity Verification', isCorrect: true),
        const QuestionOption(id: '1b', text: 'High-frequency trading'),
        const QuestionOption(id: '1c', text: 'Social media management'),
        const QuestionOption(id: '1d', text: 'Cloud storage optimization'),
      ],
      explanation: 'Soteria focuses on secure, decentralized identity.',
      hint: 'Think about security and identity.',
    ),
    Question(
      id: '2',
      text: 'Proof of Stake (PoS) is more energy-efficient than Proof of Work (PoW).',
      type: QuestionType.trueFalse,
      difficulty: QuestionDifficulty.beginner,
      categories: ['Consensus', 'Environment'],
      subjectId: 'blockchain_basics',
      options: [
        const QuestionOption(id: '2a', text: 'True', isCorrect: true),
        const QuestionOption(id: '2b', text: 'False'),
      ],
      explanation: 'PoS eliminates the need for intensive computational mining.',
    ),
    Question(
      id: '3',
      text: 'Arrange these blockchain layers in order from bottom to top.',
      type: QuestionType.ordering,
      difficulty: QuestionDifficulty.intermediate,
      categories: ['Architecture'],
      subjectId: 'blockchain_basics',
      options: [
        const QuestionOption(id: '3a', text: 'Layer 0 (Network)', order: 0),
        const QuestionOption(id: '3b', text: 'Layer 1 (Blockchain)', order: 1),
        const QuestionOption(id: '3c', text: 'Layer 2 (Scaling)', order: 2),
        const QuestionOption(id: '3d', text: 'Layer 3 (Application)', order: 3),
      ],
    ),
    Question(
      id: '4',
      text: 'Which consensus algorithm does Ethereum 2.0 use?',
      type: QuestionType.multipleChoice,
      difficulty: QuestionDifficulty.advanced,
      categories: ['Ethereum'],
      subjectId: 'ethereum_advanced',
      options: [
        const QuestionOption(id: '4a', text: 'Casper (PoS)', isCorrect: true),
        const QuestionOption(id: '4b', text: 'Lachesis'),
        const QuestionOption(id: '4c', text: 'Ouroboros'),
        const QuestionOption(id: '4d', text: 'PBFT'),
      ],
    ),
    Question(
      id: '5',
      text: 'Match the blockchain to its primary programming language.',
      type: QuestionType.matching,
      difficulty: QuestionDifficulty.advanced,
      categories: ['Programming'],
      subjectId: 'dev_track',
      options: [
        const QuestionOption(id: '5a', text: 'Ethereum', matchId: 'Solidity'),
        const QuestionOption(id: '5b', text: 'Solana', matchId: 'Rust'),
        const QuestionOption(id: '5c', text: 'Cardano', matchId: 'Haskell'),
      ],
    ),
  ];
}
