//
//  ViewController.m
//  AlertControllersample2
//
//  Created by ビザンコムマック０７ on 2014/10/30.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>{
    //1つ目のアクションシートのボタンを生成するため使われる配列
    NSArray *array1;
    //2つ目のアクションシートのボタンを生成するため使われる配列
    NSArray *array2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    //配列の初期化
    array1 = [NSArray arrayWithObjects:@"0番目",@"1番目",@"2番目",@"3番目",@"4番目", nil];
    array2 = [NSArray arrayWithObjects:@"あいうえお",@"かきくけこ",@"さしすせそ",@"たちつてと",@"なにぬねの",@"はひふへほ",@"まみむめも",@"やゆよ",@"らりるれろ",@"わをん", nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//1つ目のシートを表示というボタンを押したら呼ばれるメソッド
- (IBAction)sheetshow:(id)sender {
    //UIAlertControllerという名前のクラスを取得する
    Class class = NSClassFromString(@"UIAlertController");
    //クラスUIAlertControllerが存在するかどうか(iOS8以外だとUIAlertControllerが存在しない)
    if (class) {
        NSLog(@"クラスUIAlertControllerが存在する");
        //クラスUIAlertControllerを用いてアクションシートの変数を生成
        UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"タイトル" message:@"どれか選択してください" preferredStyle:UIAlertControllerStyleActionSheet];
        //アクションシートのボタンを追加する繰り返し処理を実行
        for (int i = 0; i < [array1 count]; i++) {
            //sheetのi番目のボタンのタイトルをarray1のi番目の要素とする
            //ボタンを押したとき引数をiとしてメソッドactionを呼ぶようにする
            [sheet addAction:[UIAlertAction actionWithTitle:[array1 objectAtIndex:i]     style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self action:i];
            }]];
        }
        //アクションシートを表示する
        [self presentViewController:sheet animated:YES completion:nil];
    }
    //存在しない場合の処理
    else{
        NSLog(@"クラスUIAlertControllerが存在しない");
        //クラスUIActionSheetを用いてアラートの変数を生成
        UIActionSheet *as = [[UIActionSheet alloc]init];
        as.title = @"選んでください";
        //アクションシートのボタンを追加する繰り返し処理を実行
        for (int i = 0; i < [array1 count]; i++) {
            //asのi番目ボタンのタイトルをarray1のi番目の要素とする
            [as addButtonWithTitle:[array1 objectAtIndex:i]];
        }
        //アクションシートを識別できるようにタグ付けする
        as.tag = 1;
        //デリゲートを自分自身に設定
        as.delegate = self;
        //アクションシートを表示
        [as showInView:self.view];
    }
}

- (IBAction)sheetshow2:(id)sender {
     //UIAlertControllerという名前のクラスを取得する
     Class class = NSClassFromString(@"UIAlertController");
     //クラスUIAlertControllerが存在するかどうか(iOS8以外だとUIAlertControllerが存在しない)
     if (class) {
     NSLog(@"クラスUIAlertControllerが存在する");
     //クラスUIAlertControllerを用いてアクションシートの変数を生成
     UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"タイトル" message:@"どれか押してください" preferredStyle:UIAlertControllerStyleActionSheet];
     //アクションシートのボタンを追加する繰り返し処理を実行
     for (int i = 0; i < [array2 count]; i++) {
     //sheetのi番目のボタンのタイトルをarray2のi番目の要素とする
     //ボタンを押したとき引数をiとしてメソッドaction2を呼ぶようにする
     [sheet addAction:[UIAlertAction actionWithTitle:[array2 objectAtIndex:i]     style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
     [self action2:i];
     }]];
     }
     //アクションシートを表示する
     [self presentViewController:sheet animated:YES completion:nil];
     }
     //存在しない場合の処理
     else{
     NSLog(@"クラスUIAlertControllerが存在しない");
     //クラスUIActionSheetを用いてアラートの変数を生成
     UIActionSheet *as = [[UIActionSheet alloc]init];
     as.title = @"選んでください";
     //アクションシートのボタンを追加する繰り返し処理を実行
     for (int i = 0; i < [array2 count]; i++) {
     //asのi番目ボタンのタイトルをarray1のi番目の要素とする
     [as addButtonWithTitle:[array2 objectAtIndex:i]];
     }
         //アクションシートを識別できるようにタグ付けする
         as.tag = 2;
     //デリゲートを自分自身に設定
     as.delegate = self;
     //アクションシートを表示
     [as showInView:self.view];
     }
}

//アクションシートのボタンを押したら呼ばれるメソッド
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //ボタンを押したアクションシートのタグが1であるかどうか
    if (actionSheet.tag == 1) {
        //引数をbuttonIndexとしてメソッドactionを呼ぶようにする
        [self action:buttonIndex];
    }
    else{
        //引数をbuttonIndexとしてメソッドaction2を呼ぶようにする
        [self action2:buttonIndex];
    }
}

//1つ目のシートのボタンを押したら呼ばれるメソッド
-(void)action:(NSInteger)i{
    self.label.text = [NSString stringWithFormat:@"1つ目のアクションシートの\n%@というボタンを押した",[array1 objectAtIndex:i]];
}

//2つ目のシートのボタンを押したら呼ばれるメソッド
-(void)action2:(NSInteger)i{
    self.label.text = [NSString stringWithFormat:@"2つ目のアクションシートの\n%@というボタンを押した",[array2 objectAtIndex:i]];
}

@end
