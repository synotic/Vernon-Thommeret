//
//  RsvpTableViewCellController.m
//  Meetup
//
//  Created by Vernon Thommeret on 8/18/09.
//  Copyright 2009 Vernon Thommeret. All rights reserved.
//

#import "RsvpTableViewCellController.h"
#import "AbstractTableViewController.h"
#import "PhotoTableViewCell.h"
#import "UserDetailViewController.h"
#import "Rsvp.h"
#import "User.h"

@implementation RsvpTableViewCellController

@synthesize rsvp = _rsvp;

- (void) dealloc {
	[_rsvp release];
	[super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	UserDetailViewController *userDetailViewController = [[UserDetailViewController alloc]
														  initWithStyle:UITableViewStyleGrouped];
	userDetailViewController.user = self.rsvp.user;
	[self.navigationController pushViewController:userDetailViewController animated:YES];
	[userDetailViewController release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *reuseIdentifier = [PhotoTableViewCell identifierWithTableView:tableView indexPath:indexPath];
	
    PhotoTableViewCell *cell = (PhotoTableViewCell *) [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
    if (cell == nil) {
        cell = [[[PhotoTableViewCell alloc] initWithTableView:tableView
													indexPath:indexPath
											  reuseIdentifier:reuseIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.defaultImage = @"userDefault";
	}
	
	[cell prepareForReuseWithTableView:tableView indexPath:indexPath];
	
	cell.photoUrl = self.rsvp.user.photoUrl;
	cell.content = self.rsvp.user.name;
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [PhotoTableViewCell cellFrameWithTableView:tableView indexPath:indexPath].size.height;
}

@end
