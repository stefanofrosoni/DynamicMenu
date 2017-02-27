Dynamic Menu
===========
![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)
![License](https://img.shields.io/packagist/l/doctrine/orm.svg)

This allows to add a dynamic menu by adding just a custom view.
Completely written in Swift3.
 

#How to use

1. Copy all files in the menuView folder to your project.
2. Add a custom view (menuView) where you want the menu to appear. Add constraits for this View.
3. Customize the MenuItems enum with all your menu items (Name + Image).
4. Add an @IBOutlet for your custom MenuView.
5. Assing an array of MenuItems to your custom MenuView. Ths array will build your menu (ordeded by the array).

More: 

6. Use the MenuViewDelegate to detect what element has beeen selected.
 
7. The "updateValue" func allow to dynamicllay update the single cell value with a new value. 

8. Customize the MenuViewTableViewCell.xib design


How to Contribute
======
1. Fork it.
2. Create your feature branch (git checkout -b new-feature).
3. Commit your changes (git commit -am 'Added new-feature').
4. Push to the branch (git push origin new-feature).
5. Create new Pull Request.


## About

Written from Scratch in Swift.
Created by
Stefano Frosoni, [@stefanofrosoni](http://twitter.com/stefanofrosoni)


## License

See [LICENCE](LICENCE).
