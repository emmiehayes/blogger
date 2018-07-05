require "rails_helper"

describe "user can edit an article" do
  describe "they link from the articles show" do
    describe "they can click a edit button" do
      it "edits the article" do

        article_1 = Article.create!(title: 'Title 1', body: 'Body 1')

        visit article_path(article_1)
        click_link 'edit'
        fill_in 'article[title]', with: 'Title has been updated!'
        fill_in 'article[body]',  with: 'Body has been updated!'
        click_link 'update_article'

        expect(current_path).to eq(article_path(article_1))
        expect(page).to_not have_content(article_1.title)
        expect(page).to_not have_content(article_1.body)
        expect(page).to have_content('Title has been updated!')
        expect(page).to have_content('Body has been updated!')
      end
    end
  end
end
