pageextension 50100 "Cust Card Preferred Contact" extends "Customer Card"
{
    layout
    {
        addafter("ContactName")
        {
            field("Preferred Contact Time"; Rec."Preferred Contact Time")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer''s preferred time for contact.';
            }
        }
    }
}