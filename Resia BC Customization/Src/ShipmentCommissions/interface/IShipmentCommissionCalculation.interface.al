interface "IShipmentCommissionCalculation"
{
    procedure GetShipmentCommission(SalesHeader: Record "Sales Header"; var total: Decimal)
}