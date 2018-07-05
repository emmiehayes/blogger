require "rails_helper"

describe "user can edit an article" do
  describe "they link from the articles show" do
    describe "they can click edit link" do
      it "edits the article" do

        article = Article.create!(title: 'Title 1', body: 'Body 1')

        visit article_path(article)
        click_link 'edit'
        fill_in 'article[title]', with: 'Title has been updated!'
        fill_in 'article[body]',  with: 'Body has been updated!'
        click_button 'Update Article'

        expect(page).to have_content('Title has been updated!')
        expect(page).to have_content('Body has been updated!')
        expect(page).to have_content('Article Updated!')
      end
    end
  end
end
