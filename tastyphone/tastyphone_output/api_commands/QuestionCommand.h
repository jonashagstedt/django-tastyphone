//
//  
//
//  Created by tastyphone on 16/8/2012.
//


#import "ApiBaseCommand.h"
#import "Question.h"
@interface QuestionCommand : ApiBaseCommand {
}

- (void)getQuestionList;
- (void)getQuestion:(NSString*)pk;
- (void)createQuestion:(Question*)aQuestion;
- (void)updateQuestion:(Question*)aQuestion withId:(NSString*)pk;
- (void)deleteQuestion:(NSString*)pk;
@end