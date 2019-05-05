//
//  ViewController.m
//  身份证
//
//  Created by spring on 2019/2/22.
//  Copyright © 2019 spring. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tx_input;
@property (weak, nonatomic) IBOutlet UILabel *label_input;
- (IBAction)doCal:(id)sender;
- (IBAction)doReset:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)doCal:(id)sender {
    
    
    char InNum[18];
    char CheckNum[11] = {'1', '0', 'X' , '9', '8', '7', '6', '5', '4', '3', '2'};
    int i = 0;
    int Sum = 0;
    
    memset(InNum, 0, 18);
    NSData *result = [_tx_input.text dataUsingEncoding:NSUTF8StringEncoding];
    memcpy(InNum, result.bytes, 17);
    for(i = 0;i < 17;i++)
    {
        // 将ASCII码值 转化为数字
        InNum[i] -= 0x30;
        printf("%d",InNum[i]);
    }
    
    Sum = InNum[0]*7 + InNum[1]*9 + InNum[2]*10 + InNum[3]*5 + InNum[4]*8 +InNum[5]*4 + InNum[6]*2 + InNum[7]*1 + InNum[8]*6
    + InNum[9]*3 + InNum[10]*7 + InNum[11]*9 + InNum[12]*10 + InNum[13]*5 + InNum[14]*8 + InNum[15]*4 + InNum[16]*2;
    NSMutableString * text_id = [[NSMutableString alloc]initWithString: @"生成的身份证号码为： \n"];
  
    
 
    for(i = 0;i < 17;i++)
    {  [ text_id appendString:[NSString stringWithFormat:@"%d",InNum[i]]];
    }
    [text_id appendString:[NSString stringWithFormat:@"%c",CheckNum[Sum % 11]]];
    _label_input.text = text_id;

}

- (IBAction)doReset:(id)sender {
    _label_input.text = @"";
    _tx_input.text = @"Result:";
}
@end
