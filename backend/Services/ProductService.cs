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

}