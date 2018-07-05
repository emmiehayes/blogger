require "rails_helper"

describe "user sees one article" do
	describe "they link from the articles index" do
		it "displays information for one article" do
      article = Article.create!(title: 'Title_1', body: 'Body_1')
			comment_1 = article.comments.create!(author_name: 'Emmie', body: 'sample comment')
			comment_2 = article.comments.create!(author_name: 'Michelle Obama', body: 'Girl Power!')

			visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
		  expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
			expect(page).to have_content("Comments (2)")
		end
	end

	describe "they fill in a comment form" do
    it "displays the comment on the article show page" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Brad Pitt!"
      fill_in "comment[body]", with: "Let's discuss this article over tea."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("Brad Pitt")
      expect(page).to have_content("Let's discuss this article over tea.")
    end
  end
end
