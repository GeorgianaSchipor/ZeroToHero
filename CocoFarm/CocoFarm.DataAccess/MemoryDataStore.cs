using System.Collections.Generic;
using System.Linq;

namespace CocoFarm.DataAccess
{
    public class MemoryDataStore<TEntity> : IDataStore<TEntity>
        where TEntity : IEntityWithId
    {
        public TEntity GetById(int id)
        {
            return storage[id];
        }

        public IEnumerable<TEntity> GetAll()
        {
            return storage.Select(keyValue => keyValue.Value);
        }

        public TEntity Create(TEntity entity)
        {
            int id = nextId++;

            entity.Id = id;
            storage.Add(id, entity);

            return entity;
        }

        public TEntity Update(TEntity entity)
        {
            storage[entity.Id] = entity;
            return entity;
        }

        public void Delete(int id)
        {
            storage.Remove(id);
        }

        private static int nextId = 1;

        private static readonly Dictionary<int, TEntity> storage = new Dictionary<int, TEntity>();
    }
}
