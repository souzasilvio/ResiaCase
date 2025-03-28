pageextension 50102 "CustomerCardExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Category Code"; Rec."Customer Category Code")
            {
                ToolTip = 'Customer Category';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {

            action("Assign default category")
            {
                Caption = 'Assign Default Category';
                ToolTip = 'Assigns a Default Category to the current Customer';
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }
}