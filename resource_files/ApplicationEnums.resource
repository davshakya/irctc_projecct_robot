*** Settings ***
Resource    GlobalLibrary.resource
*** Variables ***

#studio application enums

#pages_enum

&{pages}=    Home=HomePage    Features=FeaturesPage    Delivery=DeliveryPage    BuildCard=MaxPage    Billing=BillingDetailsPage    Payment=PaymentPage    Installment=PaymentPlanPage    ThankYou=ThankYouPage


#homepage enums

#homepage data
${pro_template} =   9GAG
@{pro_templates_list}        9GAG         Accuweather         Airbnb         Amazon Alexa
${business_n_finance}      Business & finance
@{pro_templates_list_prod}=    3D LOOK    9GAG    Accuweather    Airbnb    AllTrails    Amazon    Amazon Alexa    Amazon Kindle    Android Auto    AngelList    Asana    ASOS    Auto Trader    Badoo    BBC Media Player
@{pro_templates_list_stage}=    9GAG    Accuweather    Airbnb    All Trails    Amazon 1    Amazon Alexa    Amazon Kindle    Amazon Music    Android Auto    Angel List    Asana    ASOS    Auto Trader    Badoo    BBC Media Player
@{store_templates_list_stage}=      Grocery App & Website Starter Pack      E Commerce App & Website 	    E Commerce App & Website Starter Pack 	    E Commerce Website 	    E Learning App & Web 	E-Commerce App 	E-commerce App copy 	Grocery App 	Gym App 	Renamed Restaurant Website & App Starter Pack 	    Restaurant App 	    Retail & E-Commerce App 	Salon App 	    Spa App
@{store_templates_list_prod}=      E Commerce Website      E-Commerce App & Website 	    E-Learning Website 	    E-learning Website & App 	    Grocery App & Website 	Gym App 	Medical App 	Medical Website & App 	Restaurant Website 	Restaurant Website & App 	    Salon App 	    Spa App & Website
${pro_template_price_stage} =    662
${pro_template_price_prod} =   1321
&{mobile_no}=        india=+919999912345        us=+1-212-456-7890
&{description_for_tabs}             All=Choose up to 3 templates (apps similar to your idea) to use as a base.     Pro=Build apps, websites, wearables – any software you can imagine. No coding skills needed.       Store=Complete small business packages for a low monthly cost                       
@{list_of_description_to_search_template}        Online ecommerce platform selling clothes        random_text_asdfgrtyui            weather              
&{bant_answer}=    what_best_describes_you=Manager        size_of_your_company=250 to 1,000 people        when_do_you_need_your_software_delivered=Less than 2 months        how_much_do_you_expect_to_spend=Less than ₹400,000        Which_app_category_would_it_fit_into=Business & finance  

#studio Store page
&{monthly_payment_overview}            Development Duration=5 months ( 20 weeks )           Number of Installments=24        Length of Contract=24 months     
&{upfront_payment_overview}            Development Duration=5 months ( 20 weeks )           Length of Contract=24 months     

@{list_of_payement_popup_title}        Monthly payment Overview       Account Information    Payment Options    Thank you!    One time payment Overview    Store details    Supercharge your store        really you
         
@{country_list}        India        United States of America
${title_on_tnc}        BUILDER STUDIO STORE TERMS AND CONDITIONS
&{filter_name_on_dashboard}       StudioCalls=Studio Calls     Buildcards=Buildcards     Prototypes=Prototypes
@{url_for_starter_card}        ?exp=prodmulti&currency_id=1&pay_starter=true            ?exp=prodmulti&currency_id=2&pay_starter=true
&{freemium_elements}              feature_count=49         price_tag=Free        approve=Approved    duration=1 month (1 week)        supercharge_popup_title=Supercharge your store        upgraded_freemium_bc_status=Running         upgraded_freemium_payment_type=monthly        upgraded_duration=24 months (96 weeks)           
&{platforms_of_buildcard}         android=Android        ios=iOS    
@{installments_table_on_dashboard}        Installments    Amount    Payable date    Paid On    Status    Invoice    Action
@{installment_status_details}        Deposit    Paid    
&{additional_services_of_pro_card}        studio_one= Builder Studio One+         builder_cloud =Builder Cloud 

#login, registration and homepage enums

&{templates_types} =    StudioPro=Pro    StudioStore=Store        StudioAll=All
&{social_media_sigup}=         google_signup=google    linkedin_signup=linkedin        facebook_signup=facebook
&{all_error_msg}        error_msg_for_wrong_credential=Oops! This combination is not valid.    forgot_pwd_popup_title=Forgot your password?    error_msg_for_invalid_email=User not found!    error_msg_wrong_email=Please enter valid email    error_msg_invalid_password=Password should contain 8 characters    email_cant_blank=Email cannot be blank    Password_cant_blank=Password cannot be blank        Max_3template=Maximum of 3 template selections are allowed        name_cannot_be_blank=Name cannot be blank        valid_contact=Please enter valid contact        Email_already_taken=Email is already taken
&{webpage_title}        signIn=Sign In        signup=Sign up
&{email_id_for_signup}        empty_email_id=${EMPTY}        correct_email_id=jennifer@yopmail.com        
@{privacy_page}        privacy        ccpa
&{email_id_for_different_currency}        INR=autoinr_1402@yopmail.com    USD=amcat7@yopmail.com        GBP=auto_pound@yopmail.com    AED=nharvey@example.org    SAR=jonathanchang@example.net    EUR=santhony@example.org


# delivery page phases enums

&{phase_on_delivery_page}=    Product_Roadmap=Product Roadmap    Design=Design    PP=Professional Prototype    TM=Tailor-made Prototype    MVP=MVP    FB=Full Build      Custom_phase=New phase 1    
&{speed_on_delivery_page}=    Relaxed=Relaxed   Slow=Slow    Standard=Standard

#build card enums

&{build_card_menu_options}=    DownloadPDF=Download    InviteUser=Invite    TransferOwnership=Transfer    ShareCard=Share    ViewNowPrototype=View Prototype    CloneCard=Duplicate card      ArchiveCard=Archive card       Rename=Rename card      SignAnNDA=Sign An NDA
&{build_card_status}=    Incomplete=card_initialized    Complete=card_completed    Paid=started     Draft=draft_stage     Created=created_stage     Invited=invited_stage     Freemium=freemium_stage       Running=running_stage        Shipped=shipped_stage        Archived=archived_stage

#User Enums
&{user_type} =    User=Individual    CompanyUser=Company    Enterprize=Enterprize    CpeUser=Cpe
&{currency}=         INR=1    USD=2    EUR=3    GBP=4    JPY=5    MYR=6    CAD=7    AED=8    SAR=9    SGD=10

&{currency_name_homepage}=         INR=Indian Rupee    USD=US Dollars
@{selected_temlplate_count}        1 template selected        2 templates selected        3 templates selected

&{responsive_platform}=        Mobile=mobile        Tablet=tablet
&{type_of_payment}=    Upfront=upfront    Monthly=monthly    Weekly=weekly

&{isPrototype}=        Is_TM=TailorMade        Is_PP=Professional    Is_None=None

