README

Phet_Intern_Test_Task is composed of 4 views:

1)Launch Screen - displays Phet logo while app launches. Since app is lightweight launch time is short and this screen is merely flashed
2)HomeVC - displays Phet logo with a button to perform a segue to ListVC
3)ListVC - utilizes a Navagation Controller and Table View to display list of available simulations. This list is generated from an array at the top of ListVC and can easily be edited to add or remove simulations. Selecting an option pushes a SimulationVC to the Navigation Stack
4)SimulationVC - displays a WebView with the selected simulation inside. Also a loading bar has been added while page loads. The back button pops the view back to ListVC
