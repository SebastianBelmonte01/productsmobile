using backend.Dto;

namespace backend.Services;

public interface IProductService
{
    Task<List<ProductResponseDto>> GetAllAsync();
    Task<List<ProductResponseDto>> SearchAsync(string query);
    Task<ProductResponseDto?> UpdatePriceAsync(int id, decimal price);
}