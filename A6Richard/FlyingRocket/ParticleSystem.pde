class ParticleSystem {

  ArrayList<SmokeParticle> particles;
  PVector spawnPos;

  ParticleSystem(int num, PVector _spawnPoint) {
    particles = new ArrayList<SmokeParticle>();
    spawnPos = _spawnPoint;
    for (int i = 0; i < num; i++) {
      particles.add(new SmokeParticle(spawnPos));
    }
  }

  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      SmokeParticle p = particles.get(i);
      p.run();
      if (p.ranOut()) {
        particles.remove(i);        
      }
    }
  }


  void addParticle(PVector spawn, float num) {
    for (int i = 0; i < num; i++) {
      particles.add(new SmokeParticle(spawn));
    }
  }
}
