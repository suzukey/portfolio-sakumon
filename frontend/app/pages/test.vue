<template>
  <div class="home">
    <my-header></my-header>
    <v-main>
      <v-container>
        <v-row justify="center">
          <v-col cols="12" sm="6">
            <v-card class="text-editor-card">
              <v-card-subtitle>
                問題文
              </v-card-subtitle>
              <v-divider></v-divider>
              <v-textarea
                v-model="txtString"
                auto-grow
                filled
                class="text-editor"
              />
            </v-card>
          </v-col>
          <v-col cols="12" sm="6">
            <v-card class="text-viewer-card">
              <v-card-subtitle>
                プレビュー
              </v-card-subtitle>
              <v-divider></v-divider>
              <v-card-text class="text-viewer">
                <TextRender :txt-string="txtString" :show-image="true" />
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer app elevation="20" class="py-2">
      <v-spacer></v-spacer>
      <v-btn outlined class="ml-2">下書きを保存</v-btn>
      <v-btn color="primary" dark depressed class="ml-2">次へ</v-btn>
    </v-footer>
  </div>
</template>

<script>
import MyHeader from '~/components/common/Header.vue'

export default {
  components: {
    MyHeader,
  },
  data() {
    return {
      txtString: `
次のコードを確認してください。

![画像の説明](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/235908/273052ad-6edd-4b0b-c148-8173a96fac9d.png)

このコードをコンパイル、および実行すると、どのような結果になりますか。一つ選択してください。
`,
    }
  },
  head() {
    return {
      titleTemplate: '',
    }
  },
  layout: 'customizable',
}
</script>

<style>
.text-editor-card,
.text-viewer-card {
  height: calc(100vh - 160px);
  overflow: hidden;
}

.text-editor,
.text-viewer {
  height: calc(100% - 55px);
  overflow-x: hidden;
}
</style>
