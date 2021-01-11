require 'rails_helper'

# type: :requestでrequestのrequest用のマッチャーが使えるようになる
RSpec.describe "Staticpages", type: :request do

    # テストを実行する前の共通処理やセットアップを行う
    # 違うブロックから呼ぶのでローカル変数ではなくてインスタンス変数
    before do
        @base_title = "Ruby on Rails Tutorial Sample App"
    end

    describe "GET /" do
        it "returns http success" do
            get root_url
            expect(response).to have_http_status(:success)
            # response.bodyはHTTPレスポンスで出力されたHTML
            expect(response.body).to include @base_title
            expect(response.body).to_not include "|#{@base_title}"  
        end
    end

    describe "GET /home" do
        it "returns http success" do
            get static_pages_home_url
            expect(response).to have_http_status(:success)
            expect(response.body).to include @base_title
            expect(response.body).to_not include "|#{@base_title}"  
        end
    end

    describe "GET /help" do
        it "returns http success" do
            get static_pages_help_url
            expect(response).to have_http_status(:success)  
            expect(response.body).to include "Help|#{@base_title}"
        end
    end

    describe "GET /about" do
        it "returns http success" do
            get static_pages_about_url
            expect(response).to have_http_status(:success)
            expect(response.body).to include "About|#{@base_title}"
        end
    end

    describe "GET /contact" do
        it "returns http success" do
            get static_pages_contact_url
            expect(response).to have_http_status(:success)
            expect(response.body).to include "Contact|#{@base_title}"  
        end
    end
    
end
