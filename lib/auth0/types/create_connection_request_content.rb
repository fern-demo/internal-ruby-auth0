# frozen_string_literal: true

module Auth0
  module Types
    class CreateConnectionRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      discriminant :strategy

      member -> { Auth0::Types::CreateConnectionRequestContentAd }, key: "AD"

      member -> { Auth0::Types::CreateConnectionRequestContentAdfs }, key: "ADFS"

      member -> { Auth0::Types::CreateConnectionRequestContentAmazon }, key: "AMAZON"

      member -> { Auth0::Types::CreateConnectionRequestContentApple }, key: "APPLE"

      member -> { Auth0::Types::CreateConnectionRequestContentAuth0Oidc }, key: "AUTH0OIDC"

      member -> { Auth0::Types::CreateConnectionRequestContentAuth0 }, key: "AUTH0"

      member -> { Auth0::Types::CreateConnectionRequestContentBaidu }, key: "BAIDU"

      member -> { Auth0::Types::CreateConnectionRequestContentBitbucket }, key: "BITBUCKET"

      member -> { Auth0::Types::CreateConnectionRequestContentBitly }, key: "BITLY"

      member -> { Auth0::Types::CreateConnectionRequestContentBox }, key: "BOX"

      member -> { Auth0::Types::CreateConnectionRequestContentCustom }, key: "CUSTOM"

      member -> { Auth0::Types::CreateConnectionRequestContentDaccount }, key: "DACCOUNT"

      member -> { Auth0::Types::CreateConnectionRequestContentDropbox }, key: "DROPBOX"

      member -> { Auth0::Types::CreateConnectionRequestContentDwolla }, key: "DWOLLA"

      member -> { Auth0::Types::CreateConnectionRequestContentEmail }, key: "EMAIL"

      member -> { Auth0::Types::CreateConnectionRequestContentEvernoteSandbox }, key: "EVERNOTE_SANDBOX"

      member -> { Auth0::Types::CreateConnectionRequestContentEvernote }, key: "EVERNOTE"

      member -> { Auth0::Types::CreateConnectionRequestContentExact }, key: "EXACT"

      member -> { Auth0::Types::CreateConnectionRequestContentFacebook }, key: "FACEBOOK"

      member -> { Auth0::Types::CreateConnectionRequestContentFitbit }, key: "FITBIT"

      member -> { Auth0::Types::CreateConnectionRequestContentGitHub }, key: "GITHUB"

      member -> { Auth0::Types::CreateConnectionRequestContentGoogleApps }, key: "GOOGLE_APPS"

      member -> { Auth0::Types::CreateConnectionRequestContentGoogleOAuth2 }, key: "GOOGLE_OAUTH2"

      member -> { Auth0::Types::CreateConnectionRequestContentInstagram }, key: "INSTAGRAM"

      member -> { Auth0::Types::CreateConnectionRequestContentIP }, key: "IP"

      member -> { Auth0::Types::CreateConnectionRequestContentLine }, key: "LINE"

      member -> { Auth0::Types::CreateConnectionRequestContentLinkedin }, key: "LINKEDIN"

      member -> { Auth0::Types::CreateConnectionRequestContentOAuth1 }, key: "OAUTH1"

      member -> { Auth0::Types::CreateConnectionRequestContentOAuth2 }, key: "OAUTH2"

      member -> { Auth0::Types::CreateConnectionRequestContentOffice365 }, key: "OFFICE365"

      member -> { Auth0::Types::CreateConnectionRequestContentOidc }, key: "OIDC"

      member -> { Auth0::Types::CreateConnectionRequestContentOkta }, key: "OKTA"

      member -> { Auth0::Types::CreateConnectionRequestContentPaypalSandbox }, key: "PAYPAL_SANDBOX"

      member -> { Auth0::Types::CreateConnectionRequestContentPaypal }, key: "PAYPAL"

      member -> { Auth0::Types::CreateConnectionRequestContentPingFederate }, key: "PINGFEDERATE"

      member -> { Auth0::Types::CreateConnectionRequestContentPlanningCenter }, key: "PLANNINGCENTER"

      member -> { Auth0::Types::CreateConnectionRequestContentSalesforceCommunity }, key: "SALESFORCE_COMMUNITY"

      member -> { Auth0::Types::CreateConnectionRequestContentSalesforceSandbox }, key: "SALESFORCE_SANDBOX"

      member -> { Auth0::Types::CreateConnectionRequestContentSalesforce }, key: "SALESFORCE"

      member -> { Auth0::Types::CreateConnectionRequestContentSAML }, key: "SAMLP"

      member -> { Auth0::Types::CreateConnectionRequestContentSharepoint }, key: "SHAREPOINT"

      member -> { Auth0::Types::CreateConnectionRequestContentShop }, key: "SHOP"

      member -> { Auth0::Types::CreateConnectionRequestContentShopify }, key: "SHOPIFY"

      member -> { Auth0::Types::CreateConnectionRequestContentSms }, key: "SMS"

      member -> { Auth0::Types::CreateConnectionRequestContentSoundcloud }, key: "SOUNDCLOUD"

      member -> { Auth0::Types::CreateConnectionRequestContentThirtySevenSignals }, key: "THIRTYSEVENSIGNALS"

      member -> { Auth0::Types::CreateConnectionRequestContentTwitter }, key: "TWITTER"

      member -> { Auth0::Types::CreateConnectionRequestContentUntappd }, key: "UNTAPPD"

      member -> { Auth0::Types::CreateConnectionRequestContentVkontakte }, key: "VKONTAKTE"

      member -> { Auth0::Types::CreateConnectionRequestContentAzureAd }, key: "WAAD"

      member -> { Auth0::Types::CreateConnectionRequestContentWeibo }, key: "WEIBO"

      member -> { Auth0::Types::CreateConnectionRequestContentWindowsLive }, key: "WINDOWSLIVE"

      member -> { Auth0::Types::CreateConnectionRequestContentWordpress }, key: "WORDPRESS"

      member -> { Auth0::Types::CreateConnectionRequestContentYahoo }, key: "YAHOO"

      member -> { Auth0::Types::CreateConnectionRequestContentYandex }, key: "YANDEX"
    end
  end
end
