Given('Enter given url and click on signin link') do
  @dockerPage = DockerPage.new
  @dockerPage.loginAsUser
end

When('Enter incorrect username and incorrect password') do
  @dockerPage.navigateToPages
end

Then('Verify error messages') do
  @dockerPage.signOnWeb
end

When('Enter correct username and correct password') do
  @dockerPage.navigateToHome
end
