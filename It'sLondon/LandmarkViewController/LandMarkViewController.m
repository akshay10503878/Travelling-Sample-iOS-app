//
//  LandMarkViewController.m
//  It'sLondon
//
//  Created by akshay bansal on 10/17/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "LandMarkViewController.h"
#import "PlaceInfo.h"
#import "PlaceCell.h"
#import "LandMarkDetalVC.h"

@interface LandMarkViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray<PlaceInfo *> *places;
}
@property (strong, nonatomic) IBOutlet UITableView *placesTableView;
#define CellId  @"PlaceCell"
@end

@implementation LandMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*---set status bar color---*/
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    /*--setup data--*/
    PlaceInfo *firstPlace=[[PlaceInfo alloc] initWithPlace:@"Big Ben" imageName:@"BigBen" address:@"London SW1A 0AA" info:@"Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster in London[1] and is usually extended to refer to both the clock and the clock tower as well.[2][3] The tower is officially known as Elizabeth Tower, renamed to celebrate the Diamond Jubilee of Elizabeth II in 2012; previously, it was known simply as the Clock Tower.\
        When completed in 1859, it was, says clockmaker Ian Westworth, “the prince of timekeepers: the biggest, most accurate four-faced striking and chiming clock in the world.”[4] The tower had its 150th anniversary on 31 May 2009,[5] during which celebratory events took place.[6][7]\
        A British cultural icon, the tower is one of the most prominent symbols of the United Kingdom and is often in the establishing shot of films set in London.[8]" coordinates:CLLocationCoordinate2DMake(51.5007, 0.1245)];
    
    PlaceInfo *secondPlace=[[PlaceInfo alloc] initWithPlace:@"Buckingham Palace" imageName:@"BuckinghamPalace" address:@"London SW1A 1AA" info:@"Buckingham Palace (UK: /ˈbʌkɪŋəm ˈpælɪs/[1][2]) is the London residence and administrative headquarters of the reigning monarch of the United Kingdom.[3][4] Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality. It has been a focal point for the British people at times of national rejoicing and mourning.\
        Originally known as Buckingham House, the building at the core of today's palace was a large townhouse built for the Duke of Buckingham in 1703 on a site that had been in private ownership for at least 150 years. It was acquired by King George III in 1761[5] as a private residence for Queen Charlotte and became known as The Queen's House. During the 19th century it was enlarged, principally by architects John Nash and Edward Blore, who constructed three wings around a central courtyard. Buckingham Palace became the London residence of the British monarch on the accession of Queen Victoria in 1837." coordinates:CLLocationCoordinate2DMake(51.5014, 0.1419)];
    
    PlaceInfo *thirdPlace=[[PlaceInfo alloc] initWithPlace:@"London Eye" imageName:@"LondonEye" address:@"London SE1 7PB" info:@"The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London. As of January 2015, it has been advertised as the Coca-Cola London Eye.\
       The structure is 443 feet (135 m) tall and the wheel has a diameter of 394 feet (120 m). When it opened to the public in 2000 it was the world's tallest Ferris wheel. Its height was surpassed by the 520 feet (158 m) tall Star of Nanchang in 2006, the 541 feet (165 m) tall Singapore Flyer in 2008, and the 550 feet (168 m) High Roller (Las Vegas) in 2014. Supported by an A-frame on one side only, unlike the taller Nanchang and Singapore wheels, the Eye is described by its operators as \"the world's tallest cantilevered observation wheel\"" coordinates:CLLocationCoordinate2DMake(51.5033, 0.1195)];

    PlaceInfo *fourthPlace= [[PlaceInfo alloc] initWithPlace:@"St Paul's Cathedral" imageName:@"St-Pauls" address:@"London EC4M 8AD" info:@"St Paul's Cathedral, London, is an Anglican cathedral, the seat of the Bishop of London and the mother church of the Diocese of London. It sits on Ludgate Hill at the highest point of the City of London and is a Grade 1 listed building. Its dedication to Paul the Apostle dates back to the original church on this site, founded in AD 604.[1] The present cathedral, dating from the late 17th century, was designed in the English Baroque style by Sir Christopher Wren. Its construction, completed in Wren's lifetime, was part of a major rebuilding programme in the City after the Great Fire of London.[2]\
     The cathedral is one of the most famous and most recognisable sights of London. Its dome, framed by the spires of Wren's City churches, has dominated the skyline for over 300 years.[3] At 365 feet (111 m) high, it was the tallest building in London from 1710 to 1967. The dome is among the highest in the world. St Paul's is the second-largest church building in area in the United Kingdom after Liverpool Cathedral." coordinates:CLLocationCoordinate2DMake(51.5138, 0.0984)];
                              
     PlaceInfo *fifthPlace=[[PlaceInfo alloc] initWithPlace:@"Tower Bridge" imageName:@"TowerBridge" address:@" London SE1 2UP" info:@"Tower Bridge is a combined bascule and suspension bridge in London built between 1886 and 1894. The bridge crosses the River Thames close to the Tower of London and has become an iconic symbol of London, resulting in it sometimes being confused with London Bridge, situated some 0.5 mi (0.80 km) upstream. Tower Bridge is one of five London bridges now owned and maintained by the Bridge House Estates, a charitable trust overseen by the City of London Corporation. It is the only one of the Trust's bridges not to connect the City of London directly to the Southwark bank, as its northern landfall is in Tower Hamlets.\
    The bridge consists of two bridge towers tied together at the upper level by two horizontal walkways, designed to withstand the horizontal tension forces exerted by the suspended sections of the bridge on the landward sides of the towers. The vertical components of the forces in the suspended sections and the vertical reactions of the two walkways are carried by the two robust towers. The bascule pivots and operating machinery are housed in the base of each tower. Before its restoration in the 2010s, the bridge's colour scheme dated from 1977, when it was painted red, white and blue for Queen Elizabeth II's Silver Jubilee. Its colours were subsequently restored to blue and white." coordinates:CLLocationCoordinate2DMake(51.5055, 0.0754)];
                            
    PlaceInfo *sixthPlace=[[PlaceInfo alloc] initWithPlace:@"WestMinster abbey" imageName:@"WestminsterAbbey" address:@"London SW1P 3PA" info:@"Westminster Abbey, formally titled the Collegiate Church of St Peter at Westminster, is a large, mainly Gothic abbey church in the City of Westminster, London, just to the west of the Palace of Westminster. It is one of the United Kingdom's most notable religious buildings and the traditional place of coronation and burial site for English and, later, British monarchs. The building itself was a Benedictine monastic church until the monastery was dissolved in 1539. Between 1540 and 1556, the abbey had the status of a cathedral. Since 1560, the building is no longer an abbey or a cathedral, having instead the status of a Church of England \"Royal Peculiar\"—a church responsible directly to the sovereign." coordinates:CLLocationCoordinate2DMake(51.4993, 0.1273)];
                            
    places=[[NSArray alloc] initWithObjects:firstPlace,secondPlace,thirdPlace,fourthPlace,fifthPlace,sixthPlace, nil];
    
    /*--Added Back Button--*/
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(Back)];
    backButton.tintColor=[UIColor whiteColor];
    backButton.imageInsets = UIEdgeInsetsMake(0, -20, -10, 0);
    self.navigationItem.leftBarButtonItem = backButton;



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)Back
{
    [self dismissViewControllerAnimated:YES completion:nil]; // ios 6
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"LandMarkDetalVC"]) {
        
        LandMarkDetalVC *destinationVC=[segue destinationViewController];
        destinationVC.pInfo=[places objectAtIndex:self.placesTableView.indexPathForSelectedRow.row];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PlaceCell *cell=[self.placesTableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    ;
    
    
    PlaceInfo *place=[places objectAtIndex:indexPath.row];
    cell.place=place;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [places count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
                          
 @end


@implementation UINavigationBar (customNav)
- (CGSize)sizeThatFits:(CGSize)size {
    CGRect rec = self.frame;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    rec.size.width = screenRect.size.width;
    rec.size.height = 200;
    return rec.size;
}
@end
