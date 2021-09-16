#!/usr/bin/env bash

# templates/analysis_options.yaml を各パッケージに配置する

## 定数
CONFIGS_DIR_NAME="templates"
CONFIGS_DIR_PATH="$(pwd)/$CONFIGS_DIR_NAME"
ANALYSIS_OPTIONS_FILE_NAME="analysis_options.yaml"
ANALYSIS_OPTIONS_FILE_PATH="$CONFIGS_DIR_PATH/$ANALYSIS_OPTIONS_FILE_NAME"

## templateファイル存在チェック
if [ ! -e "$ANALYSIS_OPTIONS_FILE_PATH" ]; then
  echo "$ANALYSIS_OPTIONS_FILE_PATH is not found."
  exit 1
fi

## .dart_tool, templates/ を除いたプロジェクトフォルダ内の pubspec.yaml が格納されているディレクトリ一覧を取得
PUB_SPEC_DIRS=$(find "$(pwd)" \
  -type d -name ".dart_tool" -prune -o \
  -type d -name "$CONFIGS_DIR_NAME" -prune -o \
  -type f -name 'pubspec.yaml' \
   -exec dirname {} \;)

## 各ディレクトリにanalysis_options.yamlを配置
for PUB_SPEC_DIR in $PUB_SPEC_DIRS; do
  cp -r "$ANALYSIS_OPTIONS_FILE_PATH" "$PUB_SPEC_DIR"
  echo "copied to $PUB_SPEC_DIR"
done

echo "Done."
exit 0
