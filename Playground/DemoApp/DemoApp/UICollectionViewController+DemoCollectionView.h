//
//  UICollectionViewController+DemoCollectionView.h
//  DemoApp
//
//  Created by Hoàng Hải on 6/22/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewController ()
    NSArray *recipePhotos;
@end


@interface RecipeCollectionViewController () {
    NSArray *recipePhotos;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize recipe image array
    recipeImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
    
}


