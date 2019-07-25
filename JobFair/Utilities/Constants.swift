import Foundation

struct Constants {
    
    struct Common {
        static let defaultId = "0"
        static let inProgress = "In progress"
        static let previousPagerTitle = "Previous"
        static let nextPagerTitle = "Next"
        static let textViewPlaceholder = "Type something (Optional)"
    }
    
    struct ErrorAlertController {
        static let title = "Oh no! 😱"
        static let message = "Something went wrong. Please try again."
        static let retryTitle = "Retry"
        static let okTitle = "Ok"
    }
    
    struct News {
        static let title = "News"
    }
    
    struct Stream {
        static let dayOne = "15 MAY"
        static let dayTwo = "16 MAY"
        static let title = "LIVE STREAM"
    }
    
    struct Social {
        static let title = "About"
        static let socialName = "Social"
        static let descriptionName = "Description"
        
        static let webName = "Web"
        static let emailName = "Email"
        static let facebookName = "Facebook"
        static let instagramName = "Instagram"
        static let youtubeName = "Youtube"
        
        static let mapsButtonTitle = "Maps"
        static let webUrl = "https://jobfair.fer.unizg.hr/"
        static let emailUrl = "mailto:jobfair@fer.hr"
        static let facebookUrl = "https://www.facebook.com/JobFair.FER/"
        static let instagramUrl = "https://www.instagram.com/jobfairfer/"
        static let youtubeUrl = "https://www.youtube.com/channel/UCoQKl3GIHS5ZPuuSqp8gIzQ"
        
        static let dateName = "Date"
        static let dateDescription = "15 - 16 May 2018"
        
        static let timeName = "Time"
        static let timeDescription = """
                                    • Booths: 9h - 16h
                                    • Presentations on Wednesday 10h - 16h
                                    • Presentations on Thursday 10h - 15:30h
                                    • Workshops on Wednesday 11h - 16:30h
                                    • Workshops on Thursday 11h - 14:30h
                                    • Loosen Up party: May 15th, 20h
                                    """
        static let boothsTime = "9h - 16h"
        static let wednesdayPresentationTime = "Wednesday 10h - 16h"
        static let thursdayPresentationTime = "Thursday 10h - 15:30h"
        static let wednesdayWorkshopTime = "Wednesday 11h - 16:30h"
        static let thursdayWorkshopTime = "Thursday 11h - 14:30h"
        static let partyTime = "May 15th, 20h"
        
        static let locationName = "Location"
        static let locationDescription = "FER, Unska 3, Zagreb"
        
        // swiftlint:disable line_length
        static let description =  """
                                    Job Fair is the biggest career fair in Croatia which includes over 110 companies and is visited by over 3,000 students. The fair is held in the halls of the Faculty of Electrical Engineering and Computing in Zagreb. The goal is to offer students the chance to see what job and career opportunities there are in Croatia, as well as abroad, and to connect employers with the best students of the University of Zagreb.
                                    """
    }
    
    struct Companies {
        static let title = "Companies"
        static let industry = "Industry"
        static let description = "About"
        static let presentation = "Presentation"
        static let workshop = "Workshop"
        static let cocktailName = "Cocktail name"
        static let websiteButtonTitle = "Go to Website"
        static let boothButtonTitle = "Navigate to"
    }
    
    struct Industries {
        static let title = "Filtey by industry"
        static let all = "All"
    }
    
    struct Map {
        static let title = "Booths"
    }
    
    struct Events {
        static let agenda = "Agenda"
        static let presenter = "Presenter"
        static let dayOne = "15.5"
        static let dayTwo = "16.5"
        static let biographyHeader = "Bio"
        static let descriptionHeader = "Description"
        static let companyDetailsButtonTitle = "Company details"
        static let eventLocationButtonTitle = "Navigate to"
        static let rateHeader = "Tap to add rating"
    }
    
    struct Login {
        static let loginButtonTitle = "Login"
        static let skipButtonTitle = "I don't have username"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let forgotButtonTitle = "Forgot?"
        static let resetPasswordTitle = "Reset my password"
    }
    
    struct Assistance {
        static let title = "Assistance"
        static let headerText = "What do you need help for?"
        static let buttonText = "Ask for assistance"
        static let infoTitle = "Assistance is on the way!"
        static let infoSubtitle = "You asked for:"
    }
    
    // swiftlint:disable nesting
    struct Menu {
        struct ButtonId {
            static let drinks = "drinks"
            static let assistance = "assistance"
            static let scanQRCode = "scan_qr_code"
            static let submitCV = "submit_cv"
            static let main = "main"
        }
    }
    
    struct Drinks {
        static let title = "Drinks"
        static let drinkTitles = ["Macchiato", "Espresso", "Water"]
        static let buttonText = "Order"
        static let maxDrinks = 10
        static let infoTitle = "Your order is sent!"
        static let infoSubtitle = "You ordered:"
    }
    
    struct StudentReview {
        static let errorMessage = "Student resume not found"
        static let processingText = "Searching for student..."
        static let ambitionTitle = "Ambition"
        static let socialSkillsTitle = "Social skills"
        static let technicalSkills = "Technical skills"
        static let studentNotes = "Notes about student"
        static let submitButtonTitle = "Submit"
    }
    
    struct StudentProfile {
        static let title = "Account"
        static let nameHeaderTitle = "Name"
        static let codeCaption = "My CV QR code"
        static let signOutButtonTitle = "Sign out"
    }
}
