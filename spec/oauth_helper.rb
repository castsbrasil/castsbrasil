require 'rails_helper'

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
                                                                  credentials: {
                                                                      token: "big_token"
                                                                  },
                                                                  email: "plribeiro3000@gmail.com",
                                                                  name: "Paulo Henrique Lopes Ribeiro",
                                                                  info: {
                                                                      email: "plribeiro3000@gmail.com",
                                                                      urls: [
                                                                          "https://www.facebook.com/app_scoped_user_id/297654497066791/"
                                                                      ]
                                                                  }
                                                              })

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
                                                                 credentials: {
                                                                     token: "big_token"
                                                                 },
                                                                 nickname: "Paulo Henrique Lopes Ribeiro",
                                                                 info: {
                                                                     urls: [
                                                                         "https://www.facebook.com/app_scoped_user_id/297654497066791/"
                                                                     ]
                                                                 }
                                                             })

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                credentials: {
                                                                    token: "big_token"
                                                                },
                                                                email: "plribeiro3000@gmail.com",
                                                                nickname: "Paulo Henrique Lopes Ribeiro",
                                                                info: {
                                                                    email: "plribeiro3000@gmail.com",
                                                                    urls: [
                                                                        "https://www.facebook.com/app_scoped_user_id/297654497066791/"
                                                                    ]
                                                                }
                                                            })

OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
                                                                credentials: {
                                                                    token: "big_token"
                                                                },
                                                                email: "plribeiro3000@gmail.com",
                                                                nickname: "Paulo Henrique Lopes Ribeiro",
                                                                info: {
                                                                    email: "plribeiro3000@gmail.com",
                                                                    urls: [
                                                                        "https://www.facebook.com/app_scoped_user_id/297654497066791/"
                                                                    ]
                                                                }
                                                            })