using backend.Model;

namespace backend.Services;

public interface IProductRepository
{
    Task<List<Product>> GetAllAsync();
    Task<List<Product>> SearchAsync(string query);
    Task<Product?> GetByIdAsync(int id);
    Task SaveAsync();
}