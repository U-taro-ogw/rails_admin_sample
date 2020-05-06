# Ruby on Railsを使った管理画面のTIPS

## form object
`accepts_nested_attributes_for`を使わず親子関係を保存したりするのに使う

## ログイン
管理画面なので自由に管理者を作成できないようにしている

## 権限
- 自前で用意する場合
  主軸にするのは、controllerのアクション毎
  
  administratorテーブルに`role`カラムの追加（integer）
  enum定義 { role_A: 0, role_B: 1, role_C: 2 }
  yamlファイルを用意
  ```yaml
    role_A:
      
  ```
  
- banken
