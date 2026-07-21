# frozen_string_literal: true

module Auth0
  module Types
    class UpdateConnectionRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::UpdateConnectionRequestContentAd }

      member -> { Auth0::Types::UpdateConnectionRequestContentAdfs }

      member -> { Auth0::Types::UpdateConnectionRequestContentAmazon }

      member -> { Auth0::Types::UpdateConnectionRequestContentApple }

      member -> { Auth0::Types::UpdateConnectionRequestContentAuth0Oidc }

      member -> { Auth0::Types::UpdateConnectionRequestContentAuth0 }

      member -> { Auth0::Types::UpdateConnectionRequestContentBaidu }

      member -> { Auth0::Types::UpdateConnectionRequestContentBitbucket }

      member -> { Auth0::Types::UpdateConnectionRequestContentBitly }

      member -> { Auth0::Types::UpdateConnectionRequestContentBox }

      member -> { Auth0::Types::UpdateConnectionRequestContentCustom }

      member -> { Auth0::Types::UpdateConnectionRequestContentDaccount }

      member -> { Auth0::Types::UpdateConnectionRequestContentDropbox }

      member -> { Auth0::Types::UpdateConnectionRequestContentDwolla }

      member -> { Auth0::Types::UpdateConnectionRequestContentEmail }

      member -> { Auth0::Types::UpdateConnectionRequestContentEvernoteSandbox }

      member -> { Auth0::Types::UpdateConnectionRequestContentEvernote }

      member -> { Auth0::Types::UpdateConnectionRequestContentExact }

      member -> { Auth0::Types::UpdateConnectionRequestContentFacebook }

      member -> { Auth0::Types::UpdateConnectionRequestContentFitbit }

      member -> { Auth0::Types::UpdateConnectionRequestContentGitHub }

      member -> { Auth0::Types::UpdateConnectionRequestContentGoogleApps }

      member -> { Auth0::Types::UpdateConnectionRequestContentGoogleOAuth2 }

      member -> { Auth0::Types::UpdateConnectionRequestContentInstagram }

      member -> { Auth0::Types::UpdateConnectionRequestContentIP }

      member -> { Auth0::Types::UpdateConnectionRequestContentLine }

      member -> { Auth0::Types::UpdateConnectionRequestContentLinkedin }

      member -> { Auth0::Types::UpdateConnectionRequestContentOAuth1 }

      member -> { Auth0::Types::UpdateConnectionRequestContentOAuth2 }

      member -> { Auth0::Types::UpdateConnectionRequestContentOffice365 }

      member -> { Auth0::Types::UpdateConnectionRequestContentOidc }

      member -> { Auth0::Types::UpdateConnectionRequestContentOkta }

      member -> { Auth0::Types::UpdateConnectionRequestContentPaypal }

      member -> { Auth0::Types::UpdateConnectionRequestContentPaypalSandbox }

      member -> { Auth0::Types::UpdateConnectionRequestContentPingFederate }

      member -> { Auth0::Types::UpdateConnectionRequestContentPlanningCenter }

      member -> { Auth0::Types::UpdateConnectionRequestContentSalesforceCommunity }

      member -> { Auth0::Types::UpdateConnectionRequestContentSalesforceSandbox }

      member -> { Auth0::Types::UpdateConnectionRequestContentSalesforce }

      member -> { Auth0::Types::UpdateConnectionRequestContentSAML }

      member -> { Auth0::Types::UpdateConnectionRequestContentSharepoint }

      member -> { Auth0::Types::UpdateConnectionRequestContentShopify }

      member -> { Auth0::Types::UpdateConnectionRequestContentShop }

      member -> { Auth0::Types::UpdateConnectionRequestContentSms }

      member -> { Auth0::Types::UpdateConnectionRequestContentSoundcloud }

      member -> { Auth0::Types::UpdateConnectionRequestContentThirtySevenSignals }

      member -> { Auth0::Types::UpdateConnectionRequestContentTwitter }

      member -> { Auth0::Types::UpdateConnectionRequestContentUntappd }

      member -> { Auth0::Types::UpdateConnectionRequestContentVkontakte }

      member -> { Auth0::Types::UpdateConnectionRequestContentAzureAd }

      member -> { Auth0::Types::UpdateConnectionRequestContentWeibo }

      member -> { Auth0::Types::UpdateConnectionRequestContentWindowsLive }

      member -> { Auth0::Types::UpdateConnectionRequestContentWordpress }

      member -> { Auth0::Types::UpdateConnectionRequestContentYahoo }

      member -> { Auth0::Types::UpdateConnectionRequestContentYandex }
    end
  end
end
