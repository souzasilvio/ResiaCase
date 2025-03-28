pageextension 50101 "VendorCardExt" extends "Vendor Card"
{
    actions
    {
        addafter("Co&mments")
        {
            action("PKT Quality Classification")
            {
                Caption = 'Quality Classification';
                ApplicationArea = All;
                Image = QualificationOverview;
                RunObject = Page "Vendor Quality Card";
                RunPageLink = "Vendor No." = field("No.");
            }
        }
        addlast(Promoted)
        {
            group(PKTQuality)
            {
                Caption = 'Vendor Quality';
                actionref(PKTQualityClassification; "PKT Quality Classification")
                {
                }
            }
        }
    }
}



