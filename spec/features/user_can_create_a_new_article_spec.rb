require "rails_helper"

describe "user creates a new article" do
  describe "they link from the articles index" do
    describe "they can fill in a title and body" do
      it "creates a new article" do

        visit articles_path
        click_link "Create New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "Change Title!"
        fill_in "article[body]",  with: "Change Body!"
        click_on "Create Article"

        expect(page).to have_content("Change Title!")
        expect(page).to have_content("Change Body!")
      end
    end
  end
end
