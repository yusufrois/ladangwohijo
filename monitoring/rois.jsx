

export default function DigitalBusinessCard() {
  const profile = {
    name: "Yusuf Ro'is Wahyudi",
    title: "Founder of LadangWohIjo",
    subtitle: "Agriculture Technology • Greenhouse • IT Development",
    phone: "085777109777",
    whatsapp: "https://wa.me/6285777109777",
    website: "https://ladangwohijo.com",
    instagram: "https://instagram.com/ladangwohijo",
    location: "Blitar, East Java",
  };

  const expertise = [
    {
      icon: "🍈",
      title: "Greenhouse Melon Specialist",
      desc: "Budidaya melon premium modern dengan greenhouse dan kontrol nutrisi presisi.",
    },
    {
      icon: "📡",
      title: "IoT & Automation",
      desc: "Sistem monitoring pH, TDS, sensor ESP32, dan otomasi pertanian modern.",
    },
    {
      icon: "💻",
      title: "IT & Digital Development",
      desc: "Website bisnis, SEO, branding digital, dan pengembangan sistem berbasis web.",
    },
  ];

  return (
    <div className="min-h-screen bg-[#0c1117] text-white overflow-hidden relative flex items-center justify-center px-6 py-12">
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute top-0 right-0 w-96 h-96 bg-green-500/10 blur-3xl rounded-full"></div>
        <div className="absolute bottom-0 left-0 w-80 h-80 bg-lime-400/10 blur-3xl rounded-full"></div>
      </div>

      <div className="relative w-full max-w-6xl rounded-[36px] border border-white/10 bg-white/5 backdrop-blur-2xl shadow-[0_0_60px_rgba(0,0,0,0.45)] overflow-hidden grid lg:grid-cols-[1.1fr_0.9fr]">
        {/* LEFT SIDE */}
        <div className="p-10 lg:p-14 border-b lg:border-b-0 lg:border-r border-white/10 flex flex-col justify-between">
          <div>
            <div className="inline-flex items-center gap-3 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-sm tracking-[0.25em] uppercase text-green-300 mb-8">
              Digital Identity
            </div>

            <h1 className="text-5xl lg:text-6xl font-black leading-[1.05] tracking-tight mb-4">
              {profile.name}
            </h1>

            <div className="space-y-2 mb-10">
              <p className="text-2xl text-white font-semibold">
                {profile.title}
              </p>

              <p className="text-gray-400 text-lg leading-relaxed max-w-xl">
                {profile.subtitle}
              </p>
            </div>

            <div className="grid gap-5">
              <a
                href={profile.website}
                target="_blank"
                rel="noopener noreferrer"
                className="group flex items-center justify-between rounded-2xl border border-white/10 bg-white/5 px-6 py-5 hover:bg-white/10 transition-all"
              >
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 rounded-2xl bg-green-500/15 flex items-center justify-center text-green-300">
                    <span className="text-2xl">🌐</span>
                  </div>

                  <div>
                    <p className="text-sm text-gray-400">Website</p>
                    <p className="font-semibold">ladangwohijo.com</p>
                  </div>
                </div>

                <span className="text-gray-500 group-hover:text-white transition-all">
                  ↗
                </span>
              </a>

              <a
                href={profile.instagram}
                target="_blank"
                rel="noopener noreferrer"
                className="group flex items-center justify-between rounded-2xl border border-white/10 bg-white/5 px-6 py-5 hover:bg-white/10 transition-all"
              >
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 rounded-2xl bg-pink-500/15 flex items-center justify-center text-pink-300">
                    <span className="text-2xl">📸</span>
                  </div>

                  <div>
                    <p className="text-sm text-gray-400">Instagram</p>
                    <p className="font-semibold">@ladangwohijo</p>
                  </div>
                </div>

                <span className="text-gray-500 group-hover:text-white transition-all">
                  ↗
                </span>
              </a>

              <a
                href={profile.whatsapp}
                target="_blank"
                rel="noopener noreferrer"
                className="group flex items-center justify-between rounded-2xl border border-white/10 bg-white/5 px-6 py-5 hover:bg-white/10 transition-all"
              >
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 rounded-2xl bg-emerald-500/15 flex items-center justify-center text-emerald-300">
                    <span className="text-2xl">📞</span>
                  </div>

                  <div>
                    <p className="text-sm text-gray-400">WhatsApp</p>
                    <p className="font-semibold">{profile.phone}</p>
                  </div>
                </div>

                <span className="text-gray-500 group-hover:text-white transition-all">
                  ↗
                </span>
              </a>
            </div>
          </div>

          <div className="mt-10 flex items-center gap-3 text-gray-400 text-sm">
            <span>📍</span>
            {profile.location}
          </div>
        </div>

        {/* RIGHT SIDE */}
        <div className="p-10 lg:p-14 bg-white/[0.03] flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-10">
              <div>
                <p className="text-sm uppercase tracking-[0.3em] text-green-300 mb-3">
                  Expertise
                </p>

                <h2 className="text-4xl font-black leading-tight">
                  Professional
                  <br />
                  Profile
                </h2>
              </div>

              <div className="hidden md:flex w-28 h-28 rounded-3xl bg-white p-3 shadow-2xl">
                <img
                  src={`https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=${encodeURIComponent(profile.website)}`}
                  alt="QR"
                  className="rounded-2xl"
                />
              </div>
            </div>

            <div className="space-y-5">
              {expertise.map((item, index) => (
                <div
                  key={index}
                  className="rounded-3xl border border-white/10 bg-white/[0.04] p-6 hover:bg-white/[0.07] transition-all"
                >
                  <div className="flex items-start gap-4">
                    <div className="w-12 h-12 rounded-2xl bg-green-500/15 flex items-center justify-center text-green-300 shrink-0">
                      <span className="text-2xl">{item.icon}</span>
                    </div>

                    <div>
                      <h3 className="text-xl font-bold mb-2">
                        {item.title}
                      </h3>

                      <p className="text-gray-400 leading-relaxed text-sm">
                        {item.desc}
                      </p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="mt-12 grid grid-cols-2 gap-4">
            <a
              href={profile.whatsapp}
              target="_blank"
                rel="noopener noreferrer"
              className="rounded-2xl bg-green-500 hover:bg-green-400 transition-all text-black font-bold py-4 text-center shadow-[0_10px_40px_rgba(34,197,94,0.35)]"
            >
              Contact Me
            </a>

            <a
              href={profile.website}
              target="_blank"
                rel="noopener noreferrer"
              className="rounded-2xl border border-white/10 hover:bg-white/10 transition-all py-4 text-center font-semibold"
            >
              Visit Website
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
