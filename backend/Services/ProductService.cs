using backend.Dto;

namespace backend.Services;

public class ProductService : IProductService
{
    private readonly IProductRepository _repo;

    public ProductService(IProductRepository repo)
    {
        _repo = repo;
    }

    public Task<List<ProductResponseDto>> GetAllAsync()
    {
        return Task.FromResult(_repo.GetAllAsync().Result.Select(p => new ProductResponseDto
        {
            Id = p.Id,
            Name = p.Name,
            Sku = p.Sku,
            Price = p.Price,
            Currency = p.Currency,
            Stock = p.Stock
        }).ToList());
    }

    public async Task<List<ProductResponseDto>> SearchAsync(string query)
    {
        var products = await _repo.SearchAsync(query);
        return products.Select(p => new ProductResponseDto 
        {
            Id = p.Id,
            Name = p.Name,
            Sku = p.Sku,
            Price = p.Price,
            Currency = p.Currency,
            Stock = p.Stock
        }).ToList();
    }
    
    public async Task<ProductResponseDto?> UpdatePriceAsync(int id, decimal price)
    {
        if (price <= 0)
            throw new ArgumentException("El precio debe ser mayor que cero.");

        var product = await _repo.GetByIdAsync(id);

        if (product == null)
            return null;

        product.Price = price;

        await _repo.SaveAsync();

        return new ProductResponseDto
        {
            Id = product.Id,
            Name = product.Name,
            Sku = product.Sku,
            Price = product.Price,
            Currency = product.Currency,
            Stock = product.Stock
        };
    }

}