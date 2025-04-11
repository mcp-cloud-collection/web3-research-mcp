declare module "duck-duck-scrape" {
  export interface SearchResult {
    title: string;
    url: string;
    description: string;
    [key: string]: any;
  }

  export interface SearchResponse {
    noResults: boolean;
    vqd?: string;
    results: SearchResult[];
    [key: string]: any;
  }

  export function search(query: string, options?: any): Promise<SearchResponse>;
  export function news(query: string, options?: any): Promise<SearchResponse>;
  export function images(query: string, options?: any): Promise<any>;
  export function videos(query: string, options?: any): Promise<any>;
}
