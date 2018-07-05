require "rails_helper"

describe "user deletes an article" do
  describe "they link from the articles index" do
    describe "they can click a delete button" do
      it "deletes the article" do

        article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
        article_2 = Article.create!(title: "Title 2", body: "Body 2")
        visit article_path
        click button "Delete Article"

        expect(current_path).to eq(articles_path)

        expect(page).to_not have_content("Title 1")
        expect(page).to_not have_content("Body 1")
        expect(page).to have_content("Title 2")
      end
    end
  end
end