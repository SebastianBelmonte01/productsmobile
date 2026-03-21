namespace backend.Dto;

public class ProductResponseDto
{
    public int Id { get; set; }
    public string Sku { get; set; } = "";
    public string Name { get; set; } = "";
    public decimal Price { get; set; }
    public string Currency { get; set; } = "";
    public int Stock { get; set; }
}