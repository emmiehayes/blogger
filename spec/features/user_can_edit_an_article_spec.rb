require "rails_helper"

describe "user can edit an article" do
  describe "they link from the articles show" do
    describe "they can click a edit button" do
      it "edits the article" do

        article_1 = Article.create!(title: 'Title 1', body: 'Body 1')

        visit article_path(article_1)
        click_link "edit"

        expect(current_path).to eq(edit_article_path)

        expect(page).to have_content("Title 1")
        expect(page).to have_content("Body 1")
      end
    end
  end
end
