# FROM：ベースイメージを指定
FROM ubuntu:latest

# RUN：Dockerイメージを作成するときに実行するコマンドを指定
# RUN、COPY、ADDを多用するとlayer数が増えて、サイズが大きくなるので、コマンドは極力&&で繋げる
# 見やすくするには\で改行
RUN apt-get update && apt-get install -y \
  curl \
  nginx
RUN mkdir /new_dir

# COPY：ホストのファイルをコンテナにコピー
# 単純にファイルやフォルダをコピーしたい時はCOPYを使う
COPY copy_test.txt /new_dir

# ADD：ホストのファイルをコンテナにコピー
# 圧縮したファイルをコピーして解凍したい時等に使う
ADD add_test.txt.tar /new_dir

# CMD：コンテナ実行時のデフォルトのコマンドを指定
# CMD["executable", "param1", "param2"]
# 原則Dockerfileの最後に記述
CMD ["/bin/bash"]