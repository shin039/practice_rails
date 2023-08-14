ARG BE_RB_VER
ARG BE_APP_PATH

FROM ruby:${BE_RB_VER}

# 必要ライブラリのダウンロード
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs mariadb-client

# yarn のインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# ワーキングディレクトリの作成 & 切替
WORKDIR ${BE_APP_PATH}

# Gem
COPY Gemfile ${BE_APP_PATH}/Gemfile
COPY Gemfile.lock ${BE_APP_PATH}/Gemfile.lock
RUN bundle install

COPY . ${BE_APP_PATH}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
