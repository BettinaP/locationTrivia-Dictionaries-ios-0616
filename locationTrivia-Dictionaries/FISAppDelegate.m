//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *abbreviatedName = location[@"name"];//why didn't location[name] work to set new string to be evaluated as dictionary value, why [@"name"]?
    
  
        if ([abbreviatedName length] > length){
        abbreviatedName = [abbreviatedName substringToIndex:length];
        NSLog(@"\n\n\n\n\n\n\n\n\n this is abbrev. name: %@", abbreviatedName);
        }
    
    return abbreviatedName;

}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSDictionary *location = @{ @"name" : name,
                                @"latitude" : @(latitude),
                                @"longitude" : @(longitude)
                             };
                                
    return location;
    
}


-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    
    for (NSDictionary *location in locations){
        NSString *name = location[@"name"];// why is it for NSDictionary location and why @"name", why was error message telling me that it needs to be initialized?
        [locationNames addObject:name];
    }
    
    return locationNames;
    
}


-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
        if ([location count] != 3){
            return NO;
        }
    
    NSString *name = location[@"name"];
    if (!name){
        return NO;
    }
    
    
    NSNumber *latitude = location[@"latitude"];
    if (!latitude){
        return NO;
    }
    
    NSNumber *longitude =location[@"longitude"];
    if (!longitude){
        return NO;
    }
    return YES;
}


-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    for(NSDictionary *location in locations){
        NSString *locationName = location[@"name"];
        if ([locationName isEqualToString:name]){
            return location;
        }
    
    }
    return nil;
    
}



@end
