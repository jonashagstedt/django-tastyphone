//
//  
//
//  Created by tastyphone on 16/8/2012.
//



#import "NSString+DateToString.h"
#import "QuestionCommand.h"

@interface QuestionCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Question*)aQuestion;
@end

@implementation QuestionCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Question class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Question*)aQuestion {
        NSArray *keys = [NSArray arrayWithObjects:@"question", @"id", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aQuestion.question,
        aQuestion.QuestionId,
        aQuestion.resourceUri,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getQuestionList {
    [self.connection makeGetRequest:@"/api/v1/question/"];
}

- (void)getQuestion:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/question/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)createQuestion:(Question*)aQuestion {
    [self.connection makePostRequest:[self dictionaryFromModel:aQuestion] withDestination:@"/api/v1/question/"];
}

- (void)updateQuestion:(Question*)aQuestion withId:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/question/", pk];
    [self.connection makePutRequest:[self dictionaryFromModel:aQuestion] withDestination:uri];
}

- (void)deleteQuestion:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/question/", pk];
    [self.connection makeDeleteRequest:uri];
}


@end


