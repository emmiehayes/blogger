require "rails_helper"

describe "user deletes an article" do
  describe "they link from the articles index" do
    describe "they can click link delete" do
      it "deletes the article" do

        article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit article_path(article_1)
        click_link "delete"

        expect(page).to_not have_content("Title 1")
        expect(page).to_not have_content("Body 1")
        expect(page).to have_content("Title 2")
      end
    end
  end
end
