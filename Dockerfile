# FROM：ベースイメージを指定
FROM ubuntu:latest

# RUN：Dockerイメージを作成するときに実行するコマンドを指定
# RUN、COPY、ADDを多用するとlayer数が増えて、サイズが大きくなるので、コマンドは極力&&で繋げる
# 見やすくするには\で改行
RUN apt-get update && apt-get install -y \
  curl \
  nginx

# WORKDIR：RUNの実行場所を指定(絶対パスで指定する)
# ディレクトリがなければ作成される
WORKDIR /new_dir
RUN touch workdir_test.txt

# COPY：ホストのファイルをコンテナにコピー
# 単純にファイルやフォルダをコピーしたい時はCOPYを使う
COPY copy_test.txt /new_dir

# ADD：ホストのファイルをコンテナにコピー
# 圧縮したファイルをコピーして解凍したい時等に使う
ADD add_test.txt.tar /new_dir

# ENV：環境変数を設定
ENV key1 value1

# CMD：コンテナ実行時のデフォルトのコマンドを指定(docker run時に書き換え可能)
# CMD["executable", "param1", "param2"]
# 原則Dockerfileの最後に記述
CMD ["/bin/bash"]

# ENTRYPOINT：コンテナ実行時のデフォルトのコマンドを指定(docker run時に書き換え不可)
# 引数はCMDで記載する
# ENTRYPOINT [ "ls" ]
# CMD ["--help"]