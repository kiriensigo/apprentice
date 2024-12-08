#!/bin/bash

PASSWORD_FILE="passwords.txt"

echo "パスワードマネージャーへようこそ！"

Add_Password(){
    echo "サービス名を入力してください:"
    read service
    echo "ユーザー名を入力してください:"
    read username
    echo "パスワードを入力してください:"
    read password
    echo "$service:$username:$password" >> $PASSWORD_FILE
    echo "パスワードの追加は成功しました。"
}

Get_Password(){
    echo "サービス名を入力してください:"
    read service
    result=$(grep "^$service:" $PASSWORD_FILE)

## サービス名が保存されていた場合
    if [ -n "$result" ]; then
        username=$(echo "$result" | cut -d: -f2)
        password=$(echo "$result" | cut -d: -f3)
        echo "サービス名：$service"
        echo "ユーザー名：$username"
        echo "パスワード：$password"
    else
        echo "そのサービスは登録されていません。"
    fi
}

while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    read operator
    case $operator in
        "Add Password")
            Add_Password
            ;;
        "Get Password")
            Get_Password
            ;;
        "Exit")
            echo "Thank you!"
            exit 0
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
    echo
done
