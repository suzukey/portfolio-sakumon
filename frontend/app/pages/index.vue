<template>
  <v-main>
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <v-card>
            <v-list two-line>
              <v-subheader>
                <v-icon class="mr-2">mdi-trending-up</v-icon>
                <span>人気の投稿</span>
              </v-subheader>
              <v-tabs color="cyan darken-2" show-arrows>
                <v-tab>日間</v-tab>
                <v-tab>週間</v-tab>
                <v-tab>年間</v-tab>
                <v-tab>全体</v-tab>
              </v-tabs>

              <v-tabs-items>
                <div v-for="n of 10" :key="n">
                  <v-divider></v-divider>
                  <v-list-item>
                    <v-list-item-avatar color="grey"></v-list-item-avatar>
                    <v-list-item-content>
                      <v-list-item-title>
                        <nuxt-link to="/posts/id">
                          Our Changing Planet
                        </nuxt-link>
                      </v-list-item-title>
                      <v-list-item-subtitle>
                        <span>
                          <span>by</span>
                          <nuxt-link to="/users/id">Kurt Wagner</nuxt-link>
                        </span>
                      </v-list-item-subtitle>
                      <v-list-item-subtitle class="my-2">
                        <v-slide-group show-arrows>
                          <v-chip small class="mr-1" nuxt to="/tags/name">
                            Default
                          </v-chip>
                          <v-chip small class="mr-1" nuxt to="/tags/name">
                            国語
                          </v-chip>
                          <v-chip small class="mr-1" nuxt to="/tags/name">
                            漢字
                          </v-chip>
                          <v-chip small class="mr-1" nuxt to="/tags/name">
                            漢検2級
                          </v-chip>
                          <v-chip small class="mr-1" nuxt to="/tags">
                            Test
                          </v-chip>
                        </v-slide-group>
                      </v-list-item-subtitle>
                      <v-list-item-subtitle>
                        <span class="mr-3">2020/06/27</span>
                        <span class="mr-3">
                          <v-icon small>mdi-heart</v-icon>
                          123
                        </span>
                        <span class="mr-3">
                          <v-icon small>mdi-message</v-icon>
                          22
                        </span>
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </div>
              </v-tabs-items>
            </v-list>
          </v-card>
        </v-col>
      </v-row>
      <v-row justify="center">
        <v-col cols="12">
          <v-card>
            <v-list-item-group>
              <v-list two-line>
                <v-subheader>
                  <v-icon class="mr-2">mdi-update</v-icon>
                  <span>最新の投稿</span>
                </v-subheader>
                <v-divider></v-divider>
                <v-list-item v-for="n of 10" :key="n">
                  <v-list-item-avatar color="grey"></v-list-item-avatar>
                  <v-list-item-content>
                    <v-list-item-title>
                      Our Changing Planet
                    </v-list-item-title>
                    <v-list-item-subtitle>by Kurt Wagner</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-list-item-group>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>