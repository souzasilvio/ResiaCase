pageextension 50103 "CustomerListExt" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Assign Default Category")
            {
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assigns the Default Category to all Customers';
                Image = ChangeCustomer;
                ApplicationArea = All;

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
        }
        addlast(Promoted)
        {
            group(CustomerCategory)
            {
                Caption = 'Customer Category';
                actionref(AssingDefaultCategory; "Assign Default Category")
                {
                }
            }
        }
    }

    views
    {
        addlast
        {
            view(CustomersWithoutCategory)
            {
                Caption = 'Customers without Category assigned';
                Filters = where("Customer Category Code" = filter(''));
            }
        }
    }
}