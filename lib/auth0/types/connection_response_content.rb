# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionResponseContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      discriminant :strategy

      member -> { Auth0::Types::ConnectionResponseContentAd }, key: "AD"

      member -> { Auth0::Types::ConnectionResponseContentAdfs }, key: "ADFS"

      member -> { Auth0::Types::ConnectionResponseContentAmazon }, key: "AMAZON"

      member -> { Auth0::Types::ConnectionResponseContentApple }, key: "APPLE"

      member -> { Auth0::Types::ConnectionResponseContentDropbox }, key: "DROPBOX"

      member -> { Auth0::Types::ConnectionResponseContentBitbucket }, key: "BITBUCKET"

      member -> { Auth0::Types::ConnectionResponseContentAuth0Oidc }, key: "AUTH0OIDC"

      member -> { Auth0::Types::ConnectionResponseContentAuth0 }, key: "AUTH0"

      member -> { Auth0::Types::ConnectionResponseContentBaidu }, key: "BAIDU"

      member -> { Auth0::Types::ConnectionResponseContentBitly }, key: "BITLY"

      member -> { Auth0::Types::ConnectionResponseContentBox }, key: "BOX"

      member -> { Auth0::Types::ConnectionResponseContentCustom }, key: "CUSTOM"

      member -> { Auth0::Types::ConnectionResponseContentDaccount }, key: "DACCOUNT"

      member -> { Auth0::Types::ConnectionResponseContentDwolla }, key: "DWOLLA"

      member -> { Auth0::Types::ConnectionResponseContentEmail }, key: "EMAIL"

      member -> { Auth0::Types::ConnectionResponseContentEvernoteSandbox }, key: "EVERNOTE_SANDBOX"

      member -> { Auth0::Types::ConnectionResponseContentEvernote }, key: "EVERNOTE"

      member -> { Auth0::Types::ConnectionResponseContentExact }, key: "EXACT"

      member -> { Auth0::Types::ConnectionResponseContentFacebook }, key: "FACEBOOK"

      member -> { Auth0::Types::ConnectionResponseContentFitbit }, key: "FITBIT"

      member -> { Auth0::Types::ConnectionResponseContentGitHub }, key: "GITHUB"

      member -> { Auth0::Types::ConnectionResponseContentGoogleApps }, key: "GOOGLE_APPS"

      member -> { Auth0::Types::ConnectionResponseContentGoogleOAuth2 }, key: "GOOGLE_OAUTH2"

      member -> { Auth0::Types::ConnectionResponseContentInstagram }, key: "INSTAGRAM"

      member -> { Auth0::Types::ConnectionResponseContentIP }, key: "IP"

      member -> { Auth0::Types::ConnectionResponseContentLine }, key: "LINE"

      member -> { Auth0::Types::ConnectionResponseContentLinkedin }, key: "LINKEDIN"

      member -> { Auth0::Types::ConnectionResponseContentOAuth1 }, key: "OAUTH1"

      member -> { Auth0::Types::ConnectionResponseContentOAuth2 }, key: "OAUTH2"

      member -> { Auth0::Types::ConnectionResponseContentOffice365 }, key: "OFFICE365"

      member -> { Auth0::Types::ConnectionResponseContentOidc }, key: "OIDC"

      member -> { Auth0::Types::ConnectionResponseContentOkta }, key: "OKTA"

      member -> { Auth0::Types::ConnectionResponseContentPaypal }, key: "PAYPAL"

      member -> { Auth0::Types::ConnectionResponseContentPaypalSandbox }, key: "PAYPAL_SANDBOX"

      member -> { Auth0::Types::ConnectionResponseContentPingFederate }, key: "PINGFEDERATE"

      member -> { Auth0::Types::ConnectionResponseContentPlanningCenter }, key: "PLANNINGCENTER"

      member -> { Auth0::Types::ConnectionResponseContentSalesforceCommunity }, key: "SALESFORCE_COMMUNITY"

      member -> { Auth0::Types::ConnectionResponseContentSalesforceSandbox }, key: "SALESFORCE_SANDBOX"

      member -> { Auth0::Types::ConnectionResponseContentSalesforce }, key: "SALESFORCE"

      member -> { Auth0::Types::ConnectionResponseContentSAML }, key: "SAMLP"

      member -> { Auth0::Types::ConnectionResponseContentSharepoint }, key: "SHAREPOINT"

      member -> { Auth0::Types::ConnectionResponseContentShopify }, key: "SHOPIFY"

      member -> { Auth0::Types::ConnectionResponseContentShop }, key: "SHOP"

      member -> { Auth0::Types::ConnectionResponseContentSms }, key: "SMS"

      member -> { Auth0::Types::ConnectionResponseContentSoundcloud }, key: "SOUNDCLOUD"

      member -> { Auth0::Types::ConnectionResponseContentThirtySevenSignals }, key: "THIRTYSEVENSIGNALS"

      member -> { Auth0::Types::ConnectionResponseContentTwitter }, key: "TWITTER"

      member -> { Auth0::Types::ConnectionResponseContentUntappd }, key: "UNTAPPD"

      member -> { Auth0::Types::ConnectionResponseContentVkontakte }, key: "VKONTAKTE"

      member -> { Auth0::Types::ConnectionResponseContentAzureAd }, key: "WAAD"

      member -> { Auth0::Types::ConnectionResponseContentWeibo }, key: "WEIBO"

      member -> { Auth0::Types::ConnectionResponseContentWindowsLive }, key: "WINDOWSLIVE"

      member -> { Auth0::Types::ConnectionResponseContentWordpress }, key: "WORDPRESS"

      member -> { Auth0::Types::ConnectionResponseContentYahoo }, key: "YAHOO"

      member -> { Auth0::Types::ConnectionResponseContentYandex }, key: "YANDEX"
    end
  end
end
