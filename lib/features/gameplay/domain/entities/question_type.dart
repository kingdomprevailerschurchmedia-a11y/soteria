/// Defines the various types of questions supported by the Soteria Question Engine.
enum QuestionType {
  multipleChoice,
  trueFalse,
  fillInTheBlank,
  image,
  audio,
  video,
  ordering,
  matching,
  essay,
  ai;
  
  bool get isMediaRequired => 
    this == QuestionType.image || 
    this == QuestionType.audio || 
    this == QuestionType.video;
}
