require "rails_helper"
feature "Accounts" do
	scenario "creating an account" do
		visit new_user_registration_path
		fill_in "Email", with: "marklocklear@gmail.com"
		fill_in "Password", with: "wintas"
		fill_in "Password confirmation", with: "wintas"
		fill_in "user_organization_attributes_name", with: "Locklear Inc."
		click_button "Sign up"
		expect(page).to have_content("Successfully created User")
		expect(page).to have_content("Signed in as marklocklear@gmail.com")
	end
end